#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Performance testing bootstrap script.
"""

from __future__ import absolute_import, print_function, unicode_literals

import os
import shutil
import subprocess
import tempfile

from abc import ABCMeta, abstractmethod
from datetime import datetime
from six import with_metaclass

from filelock import FileLock
from utils import enable_log_to_stdout, fill_parse_args, manage_cli, set_kolibri_home
from settings import config


def bootstrap_database(opts, logger, *args, **kwargs):
    if not opts.database:
        raise ValueError('database engine argument is required')

    if opts.database == 'sqlite':
        db_bootstrap = SQLiteDatabaseBootstrap(opts=opts, logger=logger)
    elif opts.database == 'posgresql':
        db_bootstrap = PostgreSQLDatabaseBootstrap(opts=opts, logger=logger)

    if not db_bootstrap:
        raise ValueError('Unknown database engine')

    if db_bootstrap.prepare():
        db_bootstrap.bootstrap()
        db_bootstrap.clean()


class DatabaseBootstrap(object):

    def __init__(self, opts, logger, *args, **kwargs):
        self.opts = opts or kwargs.get('opts')
        self.logger = logger or kwargs.get('logger')
        self.channel_mapping = self.opts.channel
        super(DatabaseBootstrap, self).__init__()

    """
    Global environment preparation phase
    """
    def prepare(self):
        self.data_dir = self.__get_or_create_data_dir()
        self.channel_dir = self.__get_channel_dir(self.data_dir, self.channel_mapping)

        if self.__channel_already_imported(self.channel_dir):
            self.logger.info('Channel has already been imported, skipping')
            return False

        self.temp_dir = self.__create_temp_dir()
        set_kolibri_home(self.temp_dir, self.logger)

        return True

    @abstractmethod
    def bootstrap(self):
        pass

    """
    Global environment cleaning phase
    """
    def clean(self):
        self.__remove_temp_dir(self.temp_dir)

    #  Shared base class helper methods

    def import_channels(self, channel_mapping):
        """
        Imports the requested channels:
            - tries to retrieve channel mappings from the configuration file
            - get path to the python executable within Kolibri's virtualenv
            - get path to the kolibri module within the development installation
            - run Kolibri importchannel and importcontent django management commands for each of the channels:
                - `[python_exec] [kolibri_module] manage importchannel network [channel_id]`
                - `[python_exec] [kolibri_module] manage importcontent network [channel_id]`
        """
        try:
            channel_ids = config['channels']['mappings'][channel_mapping]
            self.logger.info('Importing {} channels for mapping: `{}`'.format(len(channel_ids), channel_mapping))
        except KeyError:
            self.logger.error('`{}` channel mapping doesn\'t exist (settings.py), stopping'.format(channel_mapping))
            return

        for channel_id in channel_ids:
            for command in ['importchannel', 'importcontent']:
                call_args = manage_cli(self.opts, command, 'network', channel_id)
                self.logger.info('Running: {}'.format(' '.join(call_args)))
                try:
                    subprocess.call(call_args)
                except OSError as e:
                    if e[1] == 'Permission denied':
                        self.logger.error('Kolibri installation not found, check your args')
                    else:
                        self.logger.error(e[1])
                    return False
        return True

    def __channel_already_imported(self, channel_dir):
        return os.path.exists(channel_dir)

    def __get_channel_dir(self, data_dir, channel_mapping):
        return os.path.join(data_dir, channel_mapping)

    def __get_or_create_data_dir(self):
        """
        Get or create data directory in which to store the bootstrap generated data and databases or database dumps
        """
        bootstrap_data_dir = os.path.join('data', 'bootstrap')

        if not os.path.exists(bootstrap_data_dir):
            os.makedirs(bootstrap_data_dir)
            self.logger.info('Creating bootstrap data directory: {}'.format(bootstrap_data_dir))
        return bootstrap_data_dir

    def __create_temp_dir(self):
        try:
            temp_dir = tempfile.mkdtemp()
            self.logger.info('Creating temporary directory: {}'.format(temp_dir))
            return temp_dir
        except IOError:
            self.logger.error('Error trying to create temporary directory: {}'.format(temp_dir))
            return None

    def __remove_temp_dir(self, temp_dir):
        try:
            shutil.rmtree(temp_dir)
            self.logger.info('Temporary directory has been deleted')
        except IOError:
            self.logger.error('Error trying to remove temporary directory')


class SQLiteDatabaseBootstrap(with_metaclass(ABCMeta, DatabaseBootstrap)):

    def bootstrap(self):
        """
        Start the SQLite bootstrap process
        """
        if self.__copy_clean_db(self.temp_dir):
            if self.import_channels(self.channel_mapping):
                self.logger.info('Copying bootstrapped data from {} to {}'.format(self.temp_dir, self.channel_dir))
                shutil.copytree(self.temp_dir, self.channel_dir)

    def __copy_clean_db(self, dest):
        """
        Copy the previously prepared testing database to the kolibri_home directory
        """
        db_name = 'db.sqlite3'
        clean_db_path = os.path.join('data', db_name)
        dest_path = os.path.join(dest, db_name)

        shutil.copyfile(clean_db_path, dest_path)

        if os.path.exists(dest_path):
            self.logger.info('Copied clean db to {}'.format(dest_path))
            return True
        else:
            self.logger.error('Error while copying clean db to {}'.format(dest_path))
            return False


class PostgreSQLDatabaseBootstrap(with_metaclass(ABCMeta, DatabaseBootstrap)):

    def bootstrap(self):
        pass


if __name__ == '__main__':
    start_time = datetime.utcnow()

    wanted_args = ['kolibri_dev', 'kolibri_venv', 'kolibri_exec', 'database', 'channel']
    opts = fill_parse_args(wanted=wanted_args, description='Velox bootstrap script')

    log_name = 'bootstrap_tests'
    logger = enable_log_to_stdout(log_name)

    with FileLock('{}.lock'.format(log_name)):
        try:
            logger.info('Bootstrap script started')

            bootstrap_database(opts, logger)

            timing = datetime.utcnow() - start_time
            duration = timing.seconds + timing.microseconds / 1000000.0
            logger.info('::Duration {}'.format(duration))
            logger.info('Bootstrap script finished')
        except Exception as e:
            logger.exception(e.message)
