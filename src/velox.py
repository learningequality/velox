#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Performance testing launcher script.

Scenarios creation from  har files:
    transformer -p plugins.kolibri har/ >scenarios/test.py

Execution examples:
Using a pex file:
    python src/velox.py -c video -ke /datos/le/kolibri-v0.9.1.pex -l 30
    python src/velox.py -c video -ke /datos/le/kolibri-v0.9.1.pex -l 5 -t example
Having kolibri installed in the system:
    python src/velox.py -c video
From development environment:
    python src/velox.py -c video -kv /datos/le/kolibri/venv/  -kd /datos/le/kolibri -l 10 -s 2
    or
    python src/velox.py -c exercise -kv /datos/le/kolibri/venv/  -kd /datos/le/kolibri -l 10 -s 2 -d postgresql
    to use postgresql database

    velox --replay -l 10 -s 2 -t example --server=http://127.0.0.1:8080

IMPORTANT NOTES:
    * Tests are fetched from the scenarios directory.
    * Tests need to have a 'run' function that will be executed to run the test.
    * If no test is passed using the command line args all the tests in the directory will be run.
    * Every test is run three times and the execution times are logged at the end of the process.

"""
# Next two lines are needed to workaround the problem caused by the
# combination of requests bug #3831 with urllib3 bug #1104
import gevent.monkey
gevent.monkey.patch_all()  # noqa

import csv
import os
import multiprocessing
import socket
import sys

from datetime import datetime
from filelock import FileLock
from locust import runners
from locust import events, web
from locust.main import version
from locust.stats import print_percentile_stats, print_error_report, print_stats
from pathlib import Path
from utils import calculate_duration
from utils import enable_log_to_stdout
from utils import get_config_opts
from utils import parse_locustfile

from utils import show_error
from utils import LocustOptions

if sys.version_info < (3, 5):
    raise Exception('Python >= 3.5 is needed to run velox')


class EnvironmentSetup(object):

    """
    Main object centralizing all the needed tasks to setup the environment,
    launch Kolibri, run tests and clean it all afterwards.

    :param: opts: Args passed through when calling the script from the command line
    :param: logger: Object to log events during the execution
    :param: db_name: In case of using Postgresql, name of the db for Kolibri
    """

    def __init__(self, opts, logger):
        # pylint: disable=too-many-instance-attributes
        # They all are reasonable in this case.
        self.opts = opts
        self.logger = logger
        self.users = self.load_users()

    def load_users(self):
        users = []
        reader = csv.reader(self.opts.users)
        for row in reader:
            users.append((row[0], '' if len(row) == 1 else row[1]))
        self.opts.users.close()
        return users


class LocustStarter(object):
    def __init__(self, base_url, locustfile):
        self.slaves_num = multiprocessing.cpu_count()
        self.locust_classes = parse_locustfile(locustfile)
        logger.info("Starting Locust %s" % version)

    def start_master(self):
        options = LocustOptions()
        options.master = True
        master_greenlet = gevent.spawn(web.start, self.locust_classes, options)
        runners.locust_runner = runners.MasterLocustRunner(self.locust_classes, options)
        try:
            master_greenlet.join()
        except KeyboardInterrupt:
            events.quitting.fire()
            print_stats(runners.locust_runner.request_stats)
            print_percentile_stats(runners.locust_runner.request_stats)
            print_error_report()
            sys.exit(0)

    def start_slave(self):
        options = LocustOptions()
        options.slave = True
        runners.locust_runner = runners.SlaveLocustRunner(self.locust_classes, options)
        slave_greenlet = runners.locust_runner.greenlet
        try:
            slave_greenlet.join()
        except socket.error as ex:
            logger.error("Failed to connect to the Locust master: %s", ex)
            sys.exit(-1)
        except KeyboardInterrupt:
            events.quitting.fire()
            sys.exit(0)

    def start(self):
        processes = []
        for _ in range(self.slaves_num):
            p_slave = multiprocessing.Process(target=self.start_slave)
            p_slave.daemon = True
            p_slave.start()
            processes.append(p_slave)
        try:
            self.start_master()
        except KeyboardInterrupt:
            sys.exit(0)


if __name__ == '__main__':
    start_date = datetime.utcnow()
    wanted_args = ['users', 'iterations', 'learners', 'test', 'server']
    opts = get_config_opts(wanted=wanted_args, description='Velox setup script')
    log_name = 'setup_tests'
    logger = enable_log_to_stdout(log_name)
    tests_durations = []
    # add scenarios directory to the sys path:
    sys.path.append(str(Path.cwd().joinpath('scenarios')))
    with FileLock('{}.lock'.format(log_name)):
        try:
            logger.info('Tests setup script started')
            es = EnvironmentSetup(opts, logger)
            os.environ['KOLIBRI_BASE_URL'] = opts.server
            for i in range(opts.iterations):
                test_start = datetime.utcnow()
                logger.info('{n} - Running test {test_name}'.format(n=i + 1, test_name=opts.test))

                # Actual test execution:
                try:
                    LocustStarter(opts.server, opts.test).start()
                except AttributeError:
                    logger.error('{} is not a correct module to run tests'.format(opts.test))
                except Exception as error:
                    show_error(logger, error, 'when trying to run {}'.format(opts.test))
                tests_durations.append(calculate_duration(test_start))

            duration = calculate_duration(start_date)
            logger.info('::Duration {}'.format(duration))
            logger.info('Tests finished')
            if tests_durations:
                logger.info('These are the tests durations:')
                logger.info(tests_durations)

        except Exception as error:
            show_error(logger, error)
