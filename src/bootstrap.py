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

from datetime import datetime

from filelock import FileLock
try:
    from settings import config
except ImportError:
    config = None
from utils import (enable_log_to_stdout, get_config_opts, manage_cli, set_kolibri_home,
                   import_postgresql_dump, export_postgresql_dump, write_options_ini)


def bootstrap_database(opts, logger, *args, **kwargs):
    if opts.database == 'sqlite':
        db_bootstrap = SQLiteDatabaseBootstrap(opts=opts, logger=logger)
    elif opts.database == 'postgresql':
        db_bootstrap = PostgreSQLDatabaseBootstrap(opts=opts, logger=logger)

    if db_bootstrap.prepare():
        db_bootstrap.bootstrap()
        db_bootstrap.clean()


class DatabaseBootstrap(object):

    def __init__(self, opts, logger, *args, **kwargs):
        self.opts = opts or kwargs.get('opts')
        self.logger = logger or kwargs.get('logger')
        self.channel_mapping = self.opts.channel
        self.db_name = self.get_db_name()
        self.resources_dir = self.__get_resources_dir()
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

        if not self.__inject_options_ini():
            self.logger.error('Error while writing options.ini, stopping')
            return False

        set_kolibri_home(self.temp_dir, self.logger)

        return True

    def bootstrap(self):
        raise NotImplementedError

    def get_db_name(self):
        raise NotImplementedError

    """
    Global environment cleaning phase
    """
    def clean(self):
        self.__remove_temp_dir(self.temp_dir)

    #  Shared base class helper methods

    def import_channels(self, channel_mapping):
        """
        Imports the requested channels
        """
        try:
            channel_ids = config['channel_mappings'][channel_mapping]
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

    def copy_imported_content(self, temp_dir, channel_dir):
        try:
            shutil.copytree(temp_dir, channel_dir)
            self.logger.info('Copying bootstrapped data from {} to {}'.format(temp_dir, channel_dir))
        except OSError:
            self.logger.info('Content data already exists, skipping')

    def copy_imported_db(self, temp_dir, channel_dir):
        db_path_orig = os.path.join(temp_dir, self.db_name)
        db_path_dest = os.path.join(channel_dir, self.db_name)

        shutil.copyfile(db_path_orig, db_path_dest)
        self.logger.info('Copying bootstrapped db from {} to {}'.format(db_path_orig, db_path_dest))

    #  Private base class helper methods

    def __channel_already_imported(self, channel_dir):
        db_path = os.path.join(channel_dir, self.db_name)
        return os.path.exists(channel_dir) and os.path.exists(db_path)

    def __get_channel_dir(self, data_dir, channel_mapping):
        return os.path.join(data_dir, channel_mapping)

    def __get_resources_dir(self):
        return 'resources'

    def __get_or_create_data_dir(self):
        """
        Get or create data directory in which to store the bootstrap generated data and databases or database dumps
        """
        bootstrap_data_dir = 'data'

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

    def __inject_options_ini(self):
        """
        Renders and injects options.ini configuration file into KOLIBRI_HOME directory
        """
        options = vars(self.opts)
        options.update({'content_dir': self.temp_dir})
        return write_options_ini(self.opts.database, self.temp_dir, options, self.logger)


class SQLiteDatabaseBootstrap(DatabaseBootstrap):

    def bootstrap(self):
        """
        Start the SQLite bootstrap process
        """
        if self.__copy_clean_db(self.temp_dir) and self.import_channels(self.channel_mapping):
            self.copy_imported_content(self.temp_dir, self.channel_dir)
            self.copy_imported_db(self.temp_dir, self.channel_dir)

    def get_db_name(self):
        return 'db.sqlite3'

    def __copy_clean_db(self, dest):
        """
        Copy the previously prepared testing database to the kolibri_home directory
        """
        clean_db_path = os.path.join(self.resources_dir, self.db_name)
        dest_path = os.path.join(dest, self.db_name)

        shutil.copyfile(clean_db_path, dest_path)

        if os.path.exists(dest_path):
            self.logger.info('Copied clean db to {}'.format(dest_path))
            return True
        else:
            self.logger.error('Error while copying clean db to {}'.format(dest_path))
            return False


class PostgreSQLDatabaseBootstrap(DatabaseBootstrap):

    def bootstrap(self):
        """
        Start the PostgreSQL bootstrap process
        """
        if self.__import_dump() and self.import_channels(self.channel_mapping):
            self.copy_imported_content(self.temp_dir, self.channel_dir)
            self.__export_dump()
            self.copy_imported_db(self.temp_dir, self.channel_dir)

    def get_db_name(self):
        return '{}.sql'.format(self.channel_mapping)

    def __export_dump(self):
        dump_path = os.path.join(self.temp_dir, self.db_name)
        return export_postgresql_dump(dump_path, self.opts, self.logger)

    def __import_dump(self):
        dump_path = os.path.join(self.resources_dir, 'postgresql.sql')
        return import_postgresql_dump(dump_path, self.opts, self.logger)


if __name__ == '__main__':
    start_time = datetime.utcnow()

    wanted_args = ['kolibri_dev', 'kolibri_venv', 'kolibri_exec', 'database', 'channel']
    opts = get_config_opts(wanted=wanted_args, description='Velox bootstrap script')

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
