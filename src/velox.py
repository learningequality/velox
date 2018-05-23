#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Performance testing launcher script.
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

IMPORTANT NOTES:
    * Tests are fetched from the scenarios directory.
    * Tests need to have a 'run' function that will be executed to run the test.
    * If no test is passed using the command line args all the tests in the directory will be run.
    * Every test is run three times and the execution times are logged at the end of the process.

"""
from __future__ import absolute_import, print_function, unicode_literals

# Next two lines are needed to workaround the problem caused by the
# combination of requests bug #3831 with urllib3 bug #1104
import gevent.monkey
gevent.monkey.patch_all()  # noqa

import os
import requests
import shutil
import subprocess
import sys
import tempfile
import time

from datetime import datetime
from filelock import FileLock
from importlib import import_module

from bootstrap import bootstrap_database
from requests.exceptions import RequestException
from utils import calculate_duration
from utils import enable_log_to_stdout, get_free_tcp_port
from utils import (set_kolibri_home, get_config_opts, manage_cli, select_cli, write_options_ini,
                   import_postgresql_dump)
from utils import show_error


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
        temp_dir = tempfile.mkdtemp()
        self.logger.info('Created temp working directory: {}'.format(temp_dir))
        self.working_dir = os.path.join(temp_dir, 'kolibri')
        self.port = get_free_tcp_port()
        self.base_url = 'http://127.0.0.1:{}'.format(self.port)
        self._instance = None

    def __set_database(self):
        """
        Uses the bootstraped data and database to setup a new
        Kolibri working environment
        """
        channel_dir = os.path.join('data', self.opts.channel)
        bootstrap_database(self.opts, self.logger)
        self.logger.info('Copying bootstrapped data from {} to {}'.format(channel_dir, self.working_dir))
        shutil.copytree(channel_dir, self.working_dir)
        self.__inject_options_ini()
        set_kolibri_home(self.working_dir, self.logger)
        if opts.database == 'postgresql':
            self.__import_dump()

    def __import_dump(self):
        dump_path = os.path.join(self.working_dir, '{}.sql'.format(self.opts.channel))
        return import_postgresql_dump(dump_path, self.opts, self.logger)

    def __inject_options_ini(self):
        """
        Renders and injects options.ini configuration file into the current working directory
        """
        options = vars(self.opts)
        options.update({'content_dir': self.working_dir})
        return write_options_ini(self.opts.database, self.working_dir, options, self.logger)

    def do_setup(self):
        """
        Prepare all the envirnoment to be able to run Kolibri and tests
        """
        self.__set_database()

    def do_clean(self, error_exit=False):
        """ Finishes Kolibri server and deletes all the temp files used
        to create the running environment
        """
        if self._instance:
            self._instance.kill()
        self.logger.info('Kolibri server has been stopped')
        try:
            shutil.rmtree(os.path.split(self.working_dir)[0])
            self.logger.info('Temp working directory has been deleted')
        except IOError:
            self.logger.error('Error trying to remove the working directory')
        except OSError:
            pass
        if error_exit:
            sys.exit(1)

    def manage(self, *args):
        """
        Handler to run kolibri manage to invoke a Django command
        """
        call_args = manage_cli(self.opts, *args)
        try:
            subprocess.Popen(call_args).wait()
        except Exception as error:
            show_error(self.logger, error)

    def start(self):
        """
        Starts Kolibri web server
        """
        try:
            kolibri_commands = select_cli(self.opts) + ['start', '--port={}'.format(self.port), '--foreground']
            if opts.kolibri_dev:
                self.logger.warn('Running kolibri from dev environment. Ensure you have run `yarn build` before')
            self._instance = subprocess.Popen(kolibri_commands)
            self._wait_for_server_start()

            self.logger.info('Kolibri server started and running in port {}'.format(self.port))
            return True
        except OSError:
            self.logger.error('Kolibri not found. Tests can\'t continue')
        except Exception:
            self.logger.error('Kolibri server did not start')
        return False

    def _wait_for_server_start(self, timeout=20):
        """
        Pauses this script until the web server is serving requests
        """
        for _ in range(timeout * 2):
            try:
                resp = requests.get(self.base_url, timeout=3)
                if resp.status_code > 0:
                    return
            except RequestException:
                pass
            time.sleep(0.5)

        raise Exception('Server did not start within {} seconds'.format(timeout))

    def load_tests(self):
        """
        If a test name is passed as an argument it returns its module.
        If not, it will return all the modules for all the tests available
        inside the scenarios directory.
        """
        def load_test(test_name):
            """
            Returns the module in scenarios directory named test_name
            :param: test_name: Name of test file in the scenarios directory
            :returns: Loaded python module
            """
            if test_name.lower().endswith('.py'):
                test_name = test_name[:-3]
            module = import_module(test_name)
            return module
        if self.opts.test != 'all':
            yield load_test(self.opts.test)
        else:
            # plugins_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'plugins')
            scenarios_tests_path = 'scenarios'
            entries = os.listdir(scenarios_tests_path)
            blacklisted = ['__init__.py', 'example.py']
            for entry in entries:
                if entry not in blacklisted and entry.endswith('.py'):
                    yield load_test(entry)
                else:
                    continue


if __name__ == '__main__':
    start_date = datetime.utcnow()
    wanted_args = ['kolibri_dev', 'kolibri_venv', 'kolibri_exec', 'database', 'channel',
                   'iterations', 'learners', 'classrooms', 'test']
    opts = get_config_opts(wanted=wanted_args, description='Velox setup script')
    log_name = 'setup_tests'
    logger = enable_log_to_stdout(log_name)
    tests_durations = {}
    # add scenarios directory to the sys path:
    sys.path.append(os.path.join(os.getcwd(), 'scenarios'))
    with FileLock('{}.lock'.format(log_name)):
        try:
            logger.info('Tests setup script started')
            es = EnvironmentSetup(opts, logger)
            es.do_setup()
            if not es.start():
                es.do_clean(True)
            os.environ['KOLIBRI_BASE_URL'] = es.base_url
            for test in es.load_tests():
                # Each test is done three times
                tests_durations[test.__name__] = []
                for i in range(opts.iterations):
                    test_start = datetime.utcnow()
                    logger.info('{n} - Running test {test_name}'.format(n=i + 1, test_name=test.__name__))

                    # Actual test execution:
                    try:
                        test.run(opts.learners)
                    except AttributeError:
                        logger.error('{} is not a correct module to run tests'.format(test.__name__))
                        # Clean temp files and quit velox:
                        es.do_clean(True)
                    except Exception as error:
                        show_error(logger, error, 'when trying to run {}'.format(test.__name__))
                    tests_durations[test.__name__].append(calculate_duration(test_start))
            es.do_clean()
            duration = calculate_duration(start_date)
            logger.info('::Duration {}'.format(duration))
            logger.info('Tests finished')
            if tests_durations:
                logger.info('These are the tests durations:')
                logger.info(tests_durations)

        except Exception as error:
            show_error(logger, error)
