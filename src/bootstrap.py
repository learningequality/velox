#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Performance testing bootstrap script.

It will try to delete the current Kolibri related SQLite3
database files and copy the prepared db.sqlite3 file to be
used for tests.

Usage: python bootstrap.py
"""

from __future__ import absolute_import, print_function, unicode_literals

import argparse
import errno
import os
import shutil
import subprocess

from datetime import datetime

from filelock import FileLock
from utils import enable_log_to_stdout
from settings import config


def bootstrap():
    """
    Start the bootstrap process:
      - set the KOLIBRI_HOME environment variable
      - delete the current Kolibri SQLite database
      - copy the database we previously prepared for testing
    """
    set_kolibri_home()

    delete_current_db()
    if copy_clean_db() and opts.channel:
        import_channels()


def import_channels():
    kolibri_exec = get_kolibri_exec()
    if kolibri_exec:
        logger.info('Using {} to run Kolibri'.format(kolibri_exec))
    else:
        logger.info('Couldn\'t find value for Kolibri management executable. Stopping...')
        return

    try:
        channel_ids = config['channels']['mappings'][opts.channel]
    except KeyError:
        logger.info('`{}` channel mapping doesn\'t exist (settings.py). Stopping...'.format(opts.channel))
        return

    logger.info('Importing {} channels for mapping: `{}` ...'.format(len(channel_ids), opts.channel))

    # run Kolibri `importchannel` django management command for each channel:
    #   `[kolibri_exec] manage importchannel network [channel_id]`
    for channel_id in channel_ids:
        for command in ['importchannel', 'importcontent']:
            try:
                call_args = [get_kolibri_exec(), 'manage', command, 'network', channel_id]
                logger.info('Running: {}'.format(' '.join(call_args)))
                subprocess.call(call_args)
            except Exception:
                # try to prepend virtualenv python executable
                kolibri_venv_python = os.path.join(get_kolibri_venv(), 'bin', 'python')
                call_args.insert(0, kolibri_venv_python)
                logger.info('Try to prepend virtualenv python executable, running: {}'.format(' '.join(call_args)))
                subprocess.call(call_args)


def copy_clean_db():
    """
    Copy the previously prepared testing database to the kolibri_home directory
    """
    kolibri_home = get_kolibri_home()
    db_name = 'db.sqlite3'

    shutil.copyfile(os.path.join('data', db_name),
                    os.path.join(kolibri_home, db_name))
    return os.path.exists(os.path.join(kolibri_home, 'db.sqlite3'))


def delete_current_db():
    """
    Delete the current Kolibri SQLite databases
    """
    db_files = ['db.sqlite3', 'db.sqlite3-shm', 'db.sqlite3-wal']
    for db_file in db_files:
        try:
            os.remove(os.path.join(get_kolibri_home(), db_file))
        except OSError as e:
            if e.errno != errno.ENOENT:  # errno.ENOENT = no such file or directory
                raise  # re-raise exception if a different error occurred


def set_kolibri_home():
    """
    Set the KOLIBRI_HOME environment variable:
      - if the directory value has been passed as a script argument, use that
      - set the default value to be the one defined as per the Kolibri code
    """
    if opts.kolibri_home:
        kolibri_home = opts.kolibri_home
    else:
        kolibri_home = os.path.join(os.path.expanduser('~'), '.kolibri')

    logger.info('Setting the KOLIBRI_HOME env to {}'.format(kolibri_home))
    os.environ.setdefault('KOLIBRI_HOME', kolibri_home)


def get_kolibri_home():
    """
    Return KOLIBRI_HOME environment variable
    """
    return os.environ.get('KOLIBRI_HOME')


def get_kolibri_venv():
    """
    Return the Kolibri virtualenv's path
    """
    if opts.kolibri_venv:
        return opts.kolibri_venv
    return os.path.join(os.path.expanduser('~'), os.path.join('.venvs', 'kolibri'))


def get_kolibri_exec():
    """
    Return the path to the Kolibri management command executable
    """
    if opts.kolibri_exec:
        return opts.kolibri_exec

    try:
        # check if `kolibri` command is avilable and surpress stdout output if it is
        cmd = 'kolibri'
        subprocess.call([cmd], stdout=open(os.devnull, 'w'), stderr=subprocess.STDOUT)
        return cmd
    except FileNotFoundError:
        return None


def fill_parse_args():
    """
    Read command line arguments
    """
    parser = argparse.ArgumentParser(description='Velox bootstrap script.')
    parser.add_argument('-ke', '--kolibri-exec', required=False,
                        help='path to the Kolibri management command executable')
    parser.add_argument('-kv', '--kolibri-venv', required=False, help='path to the Kolibri virtualenv')
    parser.add_argument('-kh', '--kolibri-home', required=False,
                        help='path to the Kolibri home directory (KOLIBRI_HOME environment variable)')
    parser.add_argument('-d', '--database', help='Database type: sqlite or posgresql', required=False,
                        default='sqlite')
    parser.add_argument('-c', '--channel',
                        choices=['no', 'large', 'multiple_small', 'video', 'exercise'],
                        help='Channels to use in Kolibri: no (no channel), large (1 large channel ~ 1Gb),'
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
            bootstrap()

            timing = datetime.utcnow() - start_time
            duration = timing.seconds + timing.microseconds / 1000000.0
            logger.info('::Duration {}'.format(duration))
            logger.info('Bootstrap script finished')
        except Exception as e:
            logger.exception(e.message)
