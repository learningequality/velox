# -*- coding: utf-8 -*-
from __future__ import print_function, unicode_literals

import logging
import socket
import sys

from contextlib import contextmanager

__all__ = ['lock', 'enable_log_to_stdout']



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
