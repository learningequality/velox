# -*- coding: utf-8 -*-
"""
Common function used by different parts of the application
"""
from __future__ import print_function, unicode_literals

import argparse
import logging
import os
import socket
import sys

__all__ = ['enable_log_to_stdout', 'get_kolibri_venv', 'get_free_tcp_port', 'manage_cli', 'set_kolibri_home',
           'select_cli']

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


def set_kolibri_home(path, logger):
    """
    Set the KOLIBRI_HOME environment variable:
      - if the directory value has been passed as an argument, use that
      - set the default value to be the one defined as per the Kolibri code
    """
    kolibri_home = path if path else os.path.join(os.path.expanduser('~'), '.kolibri')
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
    """
    Find a free tcp port to run Kolibri server
    """
    tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tcp.bind(('', 0))
    _, port = tcp.getsockname()
    tcp.close()
    return port


def fill_parse_args(wanted, **kwargs):
    """
    Create the setup to parse args for the application scripts
    :param: wanted: list of args the application will use
    :returns: A parser object to be used by the script
    """
    if not wanted:
        wanted = kwargs.get('wanted')
    description = kwargs.get('description', None)

    parser = argparse.ArgumentParser(description)
    args_definitions = get_parse_args_definitions(wanted)

    for _, arg_definition in args_definitions.items():
        arg_short, arg_long, arg_opts = arg_definition
        parser.add_argument(arg_short, arg_long, **arg_opts)
    return parser.parse_args()


def get_parse_args_definitions(wanted):
    """
    Parse the args the script neeeds
    :param: wanted: list of args the application will use
    :returns: A list with the options for the wanted args
    """
    definitions = {
        'kolibri_dev': [
            '-kd', '--kolibri-dev', {
                'required': False, 'help': 'path to the Kolibri development installation'
            },
        ],
        'kolibri_venv': [
            '-kv', '--kolibri-venv', {
                'required': False, 'help': 'path to the Kolibri virtualenv'
            }
        ],
        'kolibri_exec': [
            '-ke', '--kolibri-exec', {
                'required': False, 'help': 'command line to execute Kolibri cli'
            }
        ],
        'database': [
            '-d', '--database', {
                'required': False, 'default': 'sqlite', 'help': 'Database type: sqlite or posgresql'
            }
        ],
        'channel': [
            '-c', '--channel', {
                'required': False, 'default': 'multiple', 'choices': ['no', 'large', 'multiple', 'video', 'exercise'],
                'help': 'Channels to use in Kolibri: no (no channel), large (1 large channel ~ 1Gb),\n'
                        'multiple (10 x ~30 Mb channels), video (channel with multiple videos),\n'
                        'exercise (channel with multiple exercises)'
            }
        ],
        'learners': [
            '-l', '--learners', {
                'required': False, 'type': int, 'default': 30,
                'help': 'Number of learners per classroom that will use the tests'
            }
        ],
        'classrooms': [
            '-s', '--classrooms', {
                'required': False, 'type': int, 'default': 1, 'help': 'Number of classrooms to be created.'
            }
        ],
        'test': [
            '-t', '--test', {
                'required': False, 'default': 'all', 'help': 'Name of the test to be run (or "all" to run them all)'
            }
        ]
    }

    return dict((k, definitions[k]) for k in wanted if k in definitions)


def select_cli(opts):
    """
    Returns the right way to call kolibri execution,
    depending on the provided opts
    """
    if opts.kolibri_exec:
        commands = [opts.kolibri_exec, ]
    elif opts.kolibri_dev:
        python_exec = get_kolibri_venv_python(opts)
        kolibri_module = get_kolibri_module(opts)
        commands = [python_exec, kolibri_module]
    else:
        commands = ['kolibri', ]
    return commands


def manage_cli(opts, *args):
    """
    Returns the right way to execute kolibri manage commands,
    depending on the provided opts
    """
    commands = select_cli(opts)

    return commands + ['manage', ] + list(args)
