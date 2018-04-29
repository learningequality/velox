#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function, unicode_literals

import os
import requests
import shutil
import subprocess
import sys
import tempfile
import time
import uuid

from datetime import datetime
from filelock import FileLock

from bootstrap import DatabaseBootstrap
from requests.exceptions import RequestException
from utils import enable_log_to_stdout, get_free_tcp_port
from utils import set_kolibri_home, fill_parse_args, manage_cli, select_cli


def read_file(fname):
    """
    Read file and decode in py3
    """
    if sys.version_info < (3,):
        return open(fname).read().decode('utf-8')
    return open(fname).read()


class DatabaseSetup(object):

    def __init__(self, opts, logger, db_name=''):
        self.django_settings = 'kolibri.deployment.default.settings.base'
        self.opts = opts
        self.logger = logger
        temp_dir = tempfile.mkdtemp()
        self.logger.info('Created temp working directory: {}'.format(temp_dir))
        self.working_dir = os.path.join(temp_dir, 'kolibri')
        self.env = os.environ.copy()
        self.env["KOLIBRI_HOME"] = self.working_dir
        self.env["DJANGO_SETTINGS_MODULE"] = 'kolibri.deployment.default.settings.base'
        self.env["POSTGRES_DB"] = db_name
        self.db_path = os.path.join(self.env['KOLIBRI_HOME'], "db.sqlite3")
        self.db_alias = uuid.uuid4().hex
        self.port = get_free_tcp_port()
        self.base_url = "http://127.0.0.1:{}/".format(self.port)
        self._instance = None

    def __set_database(self):
        channel_dir = os.path.join('data', 'bootstrap', self.opts.channel)
        if not os.path.exists(channel_dir):
            self.logger.error('Channel data does not exist. Running bootstrap')
            db_bootstrap = DatabaseBootstrap(opts=self.opts, logger=self.logger)
            db_bootstrap.setup()
        self.logger.info('Copying bootstrapped data from {} to {}'.format(channel_dir, self.working_dir))
        shutil.copytree(channel_dir, self.working_dir)
        set_kolibri_home(self.working_dir, self.logger)

    def __generate_user_data(self):
        self.manage('generateuserdata', '--classes', str(self.opts.classrooms), '--users', str(self.opts.learners))

    def do_setup(self):
        self.__set_database()
        self.__generate_user_data()

    def do_clean(self):
        self._instance.kill()
        self.logger.info('Kolibri server has been stopped')
        try:
            shutil.rmtree(os.path.split(self.working_dir)[0])
            self.logger.info('Temp working directory has been deleted')
        except IOError:
            self.logger.error('Error trying to remove the working directory')
        except OSError:
            pass

    def manage(self, *args):
        call_args = manage_cli(self.opts, *args)
        try:
            subprocess.Popen(call_args, env=self.env)
        except Exception as e:
            self.logger.error(e.message)

    def start(self):
        try:
            kolibri_commands = select_cli(self.opts) + ['start', '--port={}'.format(self.port), '--foreground']
            if opts.kolibri_dev:
                self.logger.warn("Running kolibri from dev environment. Ensure you have run `yarn build` before")
            self._instance = subprocess.Popen(kolibri_commands, env=self.env)
            self._wait_for_server_start()
            self.logger.info('Kolibri server started and running in port {}'.format(self.port))
        except OSError:
            pass

    def _wait_for_server_start(self, timeout=20):
        for _ in range(timeout * 2):
            try:
                resp = requests.get(self.base_url, timeout=3)
                if resp.status_code > 0:
                    return
            except RequestException:
                pass
            time.sleep(0.5)

        raise Exception('Server did not start within {} seconds'.format(timeout))


if __name__ == '__main__':
    start_date = datetime.utcnow()
    wanted_args = ['kolibri_dev', 'kolibri_venv', 'kolibri_exec', 'database', 'channel', 'learners', 'classrooms', 'test']
    opts = fill_parse_args(wanted=wanted_args, description='Velox setup script')
    log_name = 'setup_tests'
    logger = enable_log_to_stdout(log_name)
    with FileLock('{}.lock'.format(log_name)):
        try:
            logger.info('Tests setup script started')
            db = DatabaseSetup(opts, logger)
            db.do_setup()
            db.start()

            # TO DO : run actual tests
            import ipdb
            ipdb.set_trace()
            db.do_clean()
            timing = datetime.utcnow() - start_date
            duration = timing.seconds + timing.microseconds / 1000000.0
            logger.info('::Duration {}'.format(duration))
            logger.info('Tests finished')
        except Exception as e:
            logger.exception(e.message)
