# -*- coding: utf-8 -*-
from __future__ import print_function, unicode_literals

import errno
import logging
import os
import shutil
import socket
import sys

__all__ = ['copy_clean_db', 'delete_current_db', 'enable_log_to_stdout', 'get_kolibri_venv',
           'get_free_tcp_port', 'set_kolibri_home']

if sys.version_info < (3,):
    FileNotFoundError = IOError


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


def copy_clean_db():
    """
    Copy the previously prepared testing database to the kolibri_home directory
    """
    kolibri_home = get_kolibri_home()
    db_name = 'db.sqlite3'

    shutil.copyfile(os.path.join('data', db_name),
                    os.path.join(kolibri_home, db_name))
    return os.path.exists(os.path.join(kolibri_home, 'db.sqlite3'))


def delete_current_db(logger):
    """
    Delete the current Kolibri SQLite databases
    """
    db_files = ['db.sqlite3', 'db.sqlite3-shm', 'db.sqlite3-wal']
    for db_file in db_files:
        try:
            os.remove(os.path.join(get_kolibri_home(), db_file))
            logger.info('Removing db file: {}'.format(db_file))
        except OSError as e:
            if e.errno != errno.ENOENT:  # errno.ENOENT = no such file or directory
                raise  # re-raise exception if a different error occurred


def set_kolibri_home(opts, logger):
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


def get_kolibri_venv(opts):
    """
    Return the path to the Kolibri virtualenv
    """
    if opts.kolibri_venv:
        return opts.kolibri_venv
    return os.path.join(os.path.expanduser('~'), os.path.join('.venvs', 'kolibri'))


def get_kolibri_dev(opts):
    """
    Return the path to the Kolibri development installation
    """
    if opts.kolibri_dev:
        return opts.kolibri_dev
    return None


def get_kolibri_module(opts):
    """
    Return the path to the kolibri module within the Kolibri developmnent installation directory
    i.e. [kolibri_dev]/kolibri
    """
    return os.path.join(get_kolibri_dev(opts), 'kolibri')


def get_kolibri_venv_python(opts):
    """
    Return the path to the python executable within the Kolibri virtualenv
    i.e. [kolibri_venv]/bin/python
    """
    return os.path.join(get_kolibri_venv(opts), 'bin', 'python')


def get_free_tcp_port():
    tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tcp.bind(('', 0))
    _, port = tcp.getsockname()
    tcp.close()
    return port
