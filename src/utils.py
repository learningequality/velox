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

from collections import namedtuple
from datetime import datetime

__all__ = ['calculate_duration', 'enable_log_to_stdout', 'get_config_args', 'get_free_tcp_port',
           'manage_cli', 'set_kolibri_home', 'select_cli', 'show_error']

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


def get_kolibri_module(opts):
    """
    Return the path to the kolibri module within the Kolibri developmnent installation directory
    i.e. [kolibri_dev]/kolibri
    """
    if not opts.kolibri_dev:
        raise ValueError('kolibri-dev argument is missing')
    return os.path.join(opts.kolibri_dev, 'kolibri')


def get_kolibri_venv_python(opts):
    """
    Return the path to the python executable within the Kolibri virtualenv
    i.e. [kolibri_venv]/bin/python
    """
    if not opts.kolibri_venv:
        raise ValueError('kolibri-venv argument is missing')
    return os.path.join(opts.kolibri_venv, 'bin', 'python')


def get_free_tcp_port():
    """
    Find a free tcp port to run Kolibri server
    """
    tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tcp.bind(('', 0))
    _, port = tcp.getsockname()
    tcp.close()
    return port


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


def calculate_duration(start):
    """
    Returns the difference in seconds between start and now
    :param: start: datetime to begin
    :returns: Seconds between start and end
    """
    timing = datetime.utcnow() - start
    duration = timing.seconds + timing.microseconds / 1000000.0
    return duration


def get_config_args(wanted, **kwargs):
    """
    Returns the args dictionary by taking into account the following
    prioritization order, from higher to lower:
    - command line arguments
    - settings.py file arguments, if it exists
    - defautls defined in this utils module
    """

    # Get command line arguments with the argparse module
    cmd_args = fill_parse_args(wanted, **kwargs)

    # Set default args
    args = get_default_args()

    # Try to override with args from the settings.py file
    try:
        from settings import config
    except ImportError:
        config = None

    if config and 'args' in config and isinstance(config['args'], dict):
        args.update({k: v if v else args[k] for k, v in config['args'].items()})

    # Try to override with args from the command line args
    if cmd_args and isinstance(cmd_args, argparse.Namespace):
        args.update({k: v if v else args[k] for k, v in vars(cmd_args).items()})

    # TODO: check final dict values against choices properties of the get_parse_args_definitions

    return namedtuple('ConfigOpts', args.keys())(**args)


def get_default_args():
    return {
        'kolibri_dev': '',
        'kolibri_venv': os.path.join(os.path.expanduser('~'), os.path.join('.venvs', 'kolibri')),
        'kolibri_exec': '',
        'database': 'sqlite',
        'channel': 'multiple',
        'learners': 30,
        'classrooms': 1,
        'test': 'all',
        'iterations': 3,
    }


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


def show_error(logger, error, message=''):
    error_text = str(error) if not hasattr(error, 'message') else error.message
    if message:
        error_text = '{} {}'.format(error_text, message)
    logger.error(error_text)


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
                'required': False, 'choices': ['sqlite', 'postgresql'],
                'help': 'Database type: sqlite or posgresql'
            }
        ],
        'channel': [
            '-c', '--channel', {
                'required': False, 'choices': ['no', 'large', 'multiple', 'video', 'exercise'],
                'help': 'Channels to use in Kolibri: no (no channel), large (1 large channel ~ 1Gb),\n'
                        'multiple (10 x ~30 Mb channels), video (channel with multiple videos),\n'
                        'exercise (channel with multiple exercises)'
            }
        ],
        'learners': [
            '-l', '--learners', {
                'required': False, 'type': int, 'help': 'Number of learners per classroom that will use the tests'
            }
        ],
        'classrooms': [
            '-s', '--classrooms', {
                'required': False, 'type': int, 'help': 'Number of classrooms to be created.'
            }
        ],
        'test': [
            '-t', '--test', {
                'required': False, 'help': 'Name of the test to be run (or "all" to run them all)'
            }
        ],
        'iterations': [
            '-i', '--iterations', {
                'required': False, 'type': int, 'help': 'Number of times each test will be run'
            }
        ]
    }

    return dict((k, definitions[k]) for k in wanted if k in definitions)
