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

import subprocess

from datetime import datetime

from filelock import FileLock
from utils import copy_clean_db, enable_log_to_stdout, get_kolibri_exec, get_kolibri_venv
from utils import set_kolibri_home, delete_current_db
from settings import config


def bootstrap():
    """
    Start the bootstrap process:
      - set the KOLIBRI_HOME environment variable
      - delete the current Kolibri SQLite database
      - copy the database we previously prepared for testing
    """
    set_kolibri_home(opts, logger)

    delete_current_db()
    if copy_clean_db() and opts.channel:
        import_channels()


def import_channels():
    kolibri_exec = get_kolibri_exec(opts)
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
                kolibri_venv_python = os.path.join(get_kolibri_venv(opts), 'bin', 'python')
                call_args.insert(0, kolibri_venv_python)
                logger.info('Try to prepend virtualenv python executable, running: {}'.format(' '.join(call_args)))
                subprocess.call(call_args)


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
