#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function, unicode_literals

import argparse
import sys

from datetime import datetime
from filelock import FileLock
from utils import enable_log_to_stdout


def read_file(fname):
    """
    Read file and decode in py3
    """
    if sys.version_info < (3,):
        return open(fname).read().decode('utf-8')
    return open(fname).read()


def fill_parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--database', help='Database type: sqlite or posgresql', required=False, default='sqlite')
    parser.add_argument('-c', '--channel',
                        choices=['no', 'large', 'multiple', 'video', 'exercise'],
                        help='Channels to use in Kolibri: no (no channel), large (1 large channel ~ 1Gb),\n'
                        'multiple (10 x ~30 Mb channels), video (channel with multiple videos),\n'
                        'exercise (channel with multiple exercises)',
                        required=False, default='multiple')
    parser.add_argument('-l', '--learners', help='Number of learners that are going to use the tests',
                        required=False, type=int, default=29)

    return parser.parse_args()


if __name__ == '__main__':
    start_date = datetime.utcnow()
    opts = fill_parse_args()
    log_name = 'setup_tests'
    logger = enable_log_to_stdout(log_name)
    with FileLock('{}.lock'.format(log_name)):
        try:
            logger.info('Tests setup script started')
            # to do
            timing = datetime.utcnow() - start_date
            duration = timing.seconds + timing.microseconds / 1000000.0
            logger.info('::Duration {}'.format(duration))
            logger.info('Tests finished')
        except Exception as e:
            logger.exception(e.message)
