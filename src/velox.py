#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function, unicode_literals

import argparse
import logging
import socket
import sys

from contextlib import contextmanager
from datetime import datetime


def get_lock(process_name, logger=None):
    lock_socket = socket.socket(socket.AF_UNIX)
    try:
        lock_socket.bind('\0' + process_name)
        return lock_socket
    except socket.error:
        lock_socket.close()
        message = 'Script is already running, exiting.'
        if logger:
            logger.info(message)
        print(message)
        sys.exit()


def onexit(func):
    from signal import signal, SIGABRT, SIGILL, SIGINT, SIGSEGV, SIGTERM, SIGHUP
    for sig in (SIGABRT, SIGILL, SIGINT, SIGSEGV, SIGTERM, SIGHUP):
        signal(sig, func)


@contextmanager
def lock(process_name, logger=None, oninterupt=None):
    lsocket = get_lock(process_name, logger=logger)
    if oninterupt is not None:
        onexit(oninterupt)
    yield
    lsocket.close()


def read_file(fname):
    """
    Read file and decode in py2k
    """
    if sys.version_info < (3,):
        return open(fname).read().decode("utf-8")
    return open(fname).read()


def fill_parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--database', help='Database type: sqlite or posgresql', required=False, default='sqlite')
    parser.add_argument('-c', '--channel', help='Channels to use in Kolibri: no (no channel), large (1 large channel ~ 1Gb), smalls (10 x 30 Mb channels), video (channel with  multiple videos), exercise (channel with multiple exercises', required=False, default='smalls')
    parser.add_argument('-l', '--learners', help='Number of learners that are going to use the tests', required=False, type=int, default=29)
    return parser.parse_args()


def enable_log_to_stdout(logname):
    """Given a log name, outputs > INFO to stdout."""
    log = logging.getLogger(logname)
    log.setLevel(logging.DEBUG)
    handler = logging.StreamHandler()
    handler.setLevel(logging.DEBUG)
    # create formatter:
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    handler.setFormatter(formatter)
    log.addHandler(handler)
    return log


if __name__ == '__main__':
    start_date = datetime.utcnow()
    ops = fill_parse_args()
    log_name = "setup_tests"
    logger = enable_log_to_stdout(log_name)
    with lock(log_name, logger=logger):
        try:
            logger.info("Simulate Call script started")
            # to do
            timing = datetime.utcnow() - start_date
            duration = timing.seconds + timing.microseconds / 1000000.0
            logger.info("::Duration {}".format(duration))
            logger.info("Simulate Call script finished")
        except Exception as e:
            logger.exception(e.message)
