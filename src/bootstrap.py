#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Performance testing bootstrap script.
"""

from __future__ import absolute_import, print_function, unicode_literals

import argparse
import subprocess

from datetime import datetime

from filelock import FileLock
from utils import enable_log_to_stdout, get_kolibri_venv_python, get_kolibri_module
from utils import set_kolibri_home
from settings import config


def bootstrap(logger):
    """
    Start the bootstrap process
    """
    set_kolibri_home(opts, logger)
    import_channels()


def import_channels():
    """
    Imports the requested channels:
        - tries to retrieve channel mappings from the configuration file
        - get path to the python executable within Kolibri's virtualenv
        - get path to the kolibri module within the development installation
        - run Kolibri importchannel and importcontent django management commands for each of the requested channels:
            - `[python_exec] [kolibri_module] manage importchannel network [channel_id]`
            - `[python_exec] [kolibri_module] manage importcontent network [channel_id]`
    """
    try:
        channel_ids = config['channels']['mappings'][opts.channel]
        logger.info('Importing {} channels for mapping: `{}` ...'.format(len(channel_ids), opts.channel))
    except KeyError:
        logger.info('`{}` channel mapping doesn\'t exist (settings.py). Stopping...'.format(opts.channel))
        return

    python_exec = get_kolibri_venv_python(opts)
    kolibri_module = get_kolibri_module(opts)

    for channel_id in channel_ids:
        for command in ['importchannel', 'importcontent']:
            call_args = [python_exec, kolibri_module, 'manage', command, 'network', channel_id]
            logger.info('Running: {}'.format(' '.join(call_args)))
            subprocess.call(call_args)


def fill_parse_args():
    """
    Read command line arguments
    """
    parser = argparse.ArgumentParser(description='Velox bootstrap script.')
    parser.add_argument('-kd', '--kolibri-dev', required=False,
                        help='path to the Kolibri development installation')
    parser.add_argument('-kv', '--kolibri-venv', required=False, help='path to the Kolibri virtualenv')
    parser.add_argument('-kh', '--kolibri-home', required=False,
                        help='path to the Kolibri home directory (KOLIBRI_HOME environment variable)')
    parser.add_argument('-d', '--database', help='Database type: sqlite or posgresql', required=False,
                        default='sqlite')
    parser.add_argument('-c', '--channel',
                        choices=['no', 'large', 'multiple', 'video', 'exercise'],
                        help='Channels to use in Kolibri: no (no channel), large (1 large channel ~ 1Gb),'
                             'multiple (10 x ~30 Mb channels), video (channel with multiple videos),\n'
                             'exercise (channel with multiple exercises)',
                        required=False, default='multiple')

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
            bootstrap(logger)

            timing = datetime.utcnow() - start_time
            duration = timing.seconds + timing.microseconds / 1000000.0
            logger.info('::Duration {}'.format(duration))
            logger.info('Bootstrap script finished')
        except Exception as e:
            logger.exception(e.message)
