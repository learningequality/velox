#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Performance testing bootstrap script.

It will try to delete the current Kolibri related SQLite3
database files and copy the prepared db.sqlite3 file to be
used for tests.

Usage: python bootstrap.py; or:
       python bootstrap.py --kolibri-home=/path/to/kolibri/home/dir; or:
       KOLIBRI_HOME=/path/to/kolibri/home/dir python bootstrap.py
"""

from __future__ import absolute_import, print_function, unicode_literals

import argparse
import errno
import os
import shutil

from datetime import datetime
from filelock import FileLock
from utils import enable_log_to_stdout


def bootstrap(args):
    """
    Start the bootstrap process:
      - set the KOLIBRI_HOME environment variable
      - delete the current Kolibri SQLite database
      - copy the database we previously prepared for testing
    """
    set_KOLIBRI_HOME(args.kolibri_home)

    delete_current_db()
    if copy_clean_db():
        pass


def copy_clean_db():
    """
    Copy the previously prepared testing database to the KOLIBRI_HOME directory
    """
    KOLIBRI_HOME = get_KOLIBRI_HOME()
    db_name = 'db.sqlite3'

    shutil.copyfile(os.path.join('data', db_name),
                    os.path.join(KOLIBRI_HOME, db_name))
    return os.path.exists(os.path.join(KOLIBRI_HOME, 'db.sqlite3'))


def delete_current_db():
    """
    Delete the current Kolibri SQLite databases
    """
    db_files = ['db.sqlite3', 'db.sqlite3-shm', 'db.sqlite3-wal']
    for db_file in db_files:
        try:
            os.remove(os.path.join(get_KOLIBRI_HOME(), db_file))
        except OSError as e:
            if e.errno != errno.ENOENT:  # errno.ENOENT = no such file or directory
                raise  # re-raise exception if a different error occurred


def set_KOLIBRI_HOME(kolibri_home_arg):
    """
    Set the KOLIBRI_HOME environment variable:
      - if the directory value has been passed as a script argument, use that
      - set the default value to be the one defined as per the Kolibri code
    """
    if kolibri_home_arg:
        KOLIBRI_HOME = kolibri_home_arg
    else:
        KOLIBRI_HOME = os.path.join(os.path.expanduser('~'), '.kolibri')

    os.environ.setdefault('KOLIBRI_HOME', KOLIBRI_HOME)


def get_KOLIBRI_HOME():
    """
    Return KOLIBRI_HOME environment variable
    """
    return os.environ.get('KOLIBRI_HOME')


def fill_parse_args():
    """
    Read command line arguments
    """
    parser = argparse.ArgumentParser(description='Velox bootstrap script.')
    parser.add_argument('-k', '--kolibri-home', required=False, dest='kolibri_home',
                        help='path to the Kolibri installation')
    parser.add_argument('-d', '--database', help='Database type: sqlite or posgresql', required=False,
                        default='sqlite')
    parser.add_argument('-c', '--channel',
                        choices=['no', 'large', 'multiple_small', 'video', 'exercise'],
                        help='Channels to use in Kolibri: no (no channel), large (1 large channel ~ 1Gb),\n'
                             'multiple_small (10 x ~30 Mb channels), video (channel with multiple videos),\n'
                             'exercise (channel with multiple exercises)',
                        required=False, default='multiple_small')

    return parser.parse_args()


if __name__ == '__main__':
    start_time = datetime.utcnow()
    opts = fill_parse_args()
    log_name = 'bootstrap_tests'
    logger = enable_log_to_stdout(log_name)

    with FileLock('{}.lock'.format(log_name)):
        try:
            logger.info('Bootstrap script started')

            # start the bootstrap process
            bootstrap(opts)

            timing = datetime.utcnow() - start_time
            duration = timing.seconds + timing.microseconds / 1000000.0
            logger.info('::Duration {}'.format(duration))
            logger.info('Bootstrap script finished')
        except Exception as e:
            logger.exception(e.message)
