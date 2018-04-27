#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function, unicode_literals

import os
import shutil
import subprocess
import sys
import tempfile
import uuid

from datetime import datetime
from filelock import FileLock

from bootstrap import DatabaseBootstrap
from utils import enable_log_to_stdout, get_free_tcp_port
from utils import set_kolibri_home, fill_parse_args, manage_cli


def read_file(fname):
    """
    Read file and decode in py3
    """
    if sys.version_info < (3,):
        return open(fname).read().decode('utf-8')
    return open(fname).read()


class DatabaseSetup(object):

    def __init__(self, opts, logger, db_name=None):
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
        import ipdb;ipdb.set_trace()
        self.manage('generateuserdata', '--classes {}'.format(self.opts.classrooms), '--users {}'.format(self.opts.learners))

    def do_setup(self):
        self.__set_database()
        self.__generate_user_data()

    def do_clean(self):
        try:
            shutil.rmtree(os.path.split(self.working_dir)[0])
            self.logger.info('Temp working directory has been deleted')
        except IOError:
            self.logger.error('Error trying to remove the working directory')

    def manage(self, *args):
        call_args = manage_cli(self.opts, args)
        subprocess.Popen(call_args, env=self.env)
        # sh.kolibri.manage(*args, _env=self.env, **kwargs)

    def start(self):
        # self._instance = sh.kolibri.start(port=self.port, foreground=True, _bg=True, _env=self.env)
        pass

    def kill(self):
    #     try:
    #         self._instance.process.kill()
    #         shutil.rmtree(self.env['KOLIBRI_HOME'])
    #     except OSError:
    #         pass
        pass

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

            # TO DO : run actual tests
            db.do_clean()
            timing = datetime.utcnow() - start_date
            duration = timing.seconds + timing.microseconds / 1000000.0
            logger.info('::Duration {}'.format(duration))
            logger.info('Tests finished')
        except Exception as e:
            logger.exception(e.message)
