#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function, unicode_literals

import argparse
import os
import shutil
import sys
import tempfile
import uuid

from datetime import datetime
from filelock import FileLock

from utils import enable_log_to_stdout, get_free_tcp_port
from utils import set_kolibri_home, fill_parse_args


def read_file(fname):
    """
    Read file and decode in py3
    """
    if sys.version_info < (3,):
        return open(fname).read().decode('utf-8')
    return open(fname).read()


class KolibriServer(object):

    def __init__(self, settings='kolibri.deployment.default.settings.base', db_name=None):
        self.env = os.environ.copy()
        self.env["KOLIBRI_HOME"] = tempfile.mkdtemp()
        self.env["DJANGO_SETTINGS_MODULE"] = settings
        self.env["POSTGRES_DB"] = db_name
        self.db_path = os.path.join(self.env['KOLIBRI_HOME'], "db.sqlite3")
        self.db_alias = uuid.uuid4().hex
        self.port = get_free_tcp_port()
        self.base_url = "http://127.0.0.1:{}/".format(self.port)
        self._instance = None

    def start(self):
        # self._instance = sh.kolibri.start(port=self.port, foreground=True, _bg=True, _env=self.env)
        pass

    def kill(self):
        try:
            self._instance.process.kill()
            shutil.rmtree(self.env['KOLIBRI_HOME'])
        except OSError:
            pass

    def manage(self, *args, **kwargs):
        # sh.kolibri.manage(*args, _env=self.env, **kwargs)
        pass


class DatabaseSetup(KolibriServer):

    def __init__(self, opts, logger, db_name=None):
        self.django_settings = 'kolibri.deployment.default.settings.base'
        self.opts = opts
        self.logger = logger
        temp_dir = tempfile.mkdtemp()

        self.logger.info('Created temp working directory: {}'.format(temp_dir))
        self.working_dir = os.path.join(temp_dir, 'kolibri')

        super(DatabaseSetup, self).__init__(settings=self.django_settings, db_name=db_name)

    def __set_database(self):
        channel_dir = os.path.join('data', 'bootstrap', self.opts.channel)
        if not os.path.exists(channel_dir):
            self.logger.error('Channel data does not exist. Bootstrap script must be run first')
            # To DO: Run bootstrap script from here
            return False
        self.logger.info('Copying bootstrapped data from {} to {}'.format(channel_dir, self.working_dir))
        shutil.copytree(channel_dir, self.working_dir)
        set_kolibri_home(self.working_dir, self.logger)
        return True

    def __set_learners(self):
        pass

    def __set_classrooms(self):
        pass

    def do_setup(self):
        if self.__set_database():
            self.__set_classrooms()
            self.__set_learners()

    def do_clean(self):
        try:
            shutil.rmtree(os.path.split(self.working_dir)[0])
            self.logger.info('Temp working directory has been deleted')
        except IOError:
            self.logger.error('Error trying to remove the working directory')


if __name__ == '__main__':
    start_date = datetime.utcnow()
    opts = fill_parse_args(wanted=['database', 'channel', 'learners', 'classrooms'], description='Velox setup script')
    log_name = 'setup_tests'
    logger = enable_log_to_stdout(log_name)
    with FileLock('{}.lock'.format(log_name)):
        try:
            logger.info('Tests setup script started')
            db = DatabaseSetup(opts, logger)
            db.do_setup()
            # to do
            db.do_clean()
            timing = datetime.utcnow() - start_date
            duration = timing.seconds + timing.microseconds / 1000000.0
            logger.info('::Duration {}'.format(duration))
            logger.info('Tests finished')
        except Exception as e:
            logger.exception(e.message)
