# -*- coding: utf-8 -*-
from __future__ import print_function, unicode_literals

import errno
import logging
import os
import shutil
import subprocess

__all__ = ['copy_clean_db', 'delete_current_db', 'enable_log_to_stdout', 'get_kolibri_venv', 'set_kolibri_home']


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
    Return the Kolibri virtualenv's path
    """
    if opts.kolibri_venv:
        return opts.kolibri_venv
    return os.path.join(os.path.expanduser('~'), os.path.join('.venvs', 'kolibri'))


def get_kolibri_exec(opts):
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
