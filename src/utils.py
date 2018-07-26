# -*- coding: utf-8 -*-
"""
Common function used by different parts of the application
"""
from __future__ import print_function, unicode_literals

import argparse
import logging
import os
import socket
import subprocess
import sys
import time
import traceback

from datetime import datetime
from string import Template

__all__ = ['calculate_duration', 'enable_log_to_stdout', 'get_config_opts', 'get_free_tcp_port', 'manage_cli',
           'set_kolibri_home', 'select_cli', 'show_error', 'import_postgresql_dump', 'export_postgresql_dump',
           'write_options_ini', 'add_timestamp']

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
    os.environ['KOLIBRI_HOME'] = kolibri_home


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


def import_postgresql_dump(dump_path, opts, logger):
    try:
        insert_cmd = ['psql',
                      '-h', opts.db_postgresql_host,
                      '-U', opts.db_postgresql_user,
                      '-d', opts.db_postgresql_name,
                      '-f', dump_path]
        subprocess.Popen(insert_cmd, env={'PGPASSWORD': opts.db_postgresql_password}).wait()
        logger.info('Postgres database dump imported from: {}'.format(dump_path))
        return True
    except Exception:
        logger.error('Error trying to dump Postgres database')
        return False


def export_postgresql_dump(dump_path, opts, logger):
    dump_cmd = ['pg_dump',
                '-U', opts.db_postgresql_user,
                '-h', opts.db_postgresql_host,
                opts.db_postgresql_name,
                '--clean',
                '-f', dump_path]
    subprocess.Popen(dump_cmd, env={'PGPASSWORD': opts.db_postgresql_password}).wait()

    if not os.path.exists(dump_path):
        logger.error('Error trying to dump Postgres database')
        return False

    logger.info('Postgres database dump exported to: {}'.format(dump_path))
    return True


def write_options_ini(template, dest, options, logger):
    """
    Render options.ini from a template file (located within the resources directory)
    and write it to the specified destiation directory, using the passed `options`
    dictionary for the config options
    """
    tmpl_filename = 'options.{}.ini'.format(template)
    logger.info('Using {} as options.ini template'.format(tmpl_filename))
    tmpl_path = open(os.path.join('resources', tmpl_filename))
    tmpl = Template(tmpl_path.read())

    dest_path = os.path.join(dest, 'options.ini')
    with open(dest_path, 'w') as ini:
        ini.write(tmpl.substitute(options))

    if not os.path.exists(dest_path):
        logger.error('Error trying to write options.ini')
        return False

    logger.info('options.ini was rendered and written to: {}'.format(dest_path))
    return True


def calculate_duration(start):
    """
    Returns the difference in seconds between start and now
    :param: start: datetime to begin
    :returns: Seconds between start and end
    """
    timing = datetime.utcnow() - start
    duration = timing.seconds + timing.microseconds / 1000000.0
    return duration


def show_error(logger, error, message=''):
    error_text = str(error) if not hasattr(error, 'message') else error.message
    if message:
        error_text = '{} {}'.format(error_text, message)
    logger.error(error_text)
    traceback.print_exc(file=sys.stdout)


def get_config_opts(wanted, **kwargs):
    """
    Returns the `argparse.Namespace` object by taking into account
    the following prioritization order, from higher to lower:
    - command line arguments
    - settings.py file arguments, if it exists
    - defaults defined in this utils module
    """
    try:
        from settings import config
    except ImportError:
        config = None

    # Get command line arguments with the argparse module
    opts = fill_parse_args(wanted, **kwargs)
    args_definitions = get_parse_args_definitions()

    # We assume that all the options are listed in the `get_default_args` function
    for opt_key, default_value in get_default_args().items():
        # Command line arguments have the highest priority
        if opt_key not in opts or not getattr(opts, opt_key, None):
            # Try to get options from the config
            if config:
                try:
                    setattr(opts, opt_key, config[opt_key])
                except KeyError:
                    pass

            # If opt is still not set, assign default value
            if not getattr(opts, opt_key, None):
                setattr(opts, opt_key, default_value)

        # Verify values against args_definitions choices
        if opt_key in args_definitions:
            try:
                # Here we're assuming the position of the args configuration dict
                args_conf = args_definitions[opt_key][2]
            except KeyError:
                # And try one more time if the short arg format was not used
                args_conf = args_definitions[opt_key][1]
            except Exception:
                args_conf = None

            if args_conf and 'choices' in args_conf and getattr(opts, opt_key) not in args_conf['choices']:
                raise ValueError('{} is expected to be one of [{}]'.format(
                    opt_key, ', '.join(args_conf['choices'])))

    return opts


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
        'db_postgresql_name': '',
        'db_postgresql_user': '',
        'db_postgresql_password': '',
        'db_postgresql_host': '127.0.0.1'
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
        try:
            arg_short, arg_long, arg_opts = arg_definition
            parser.add_argument(arg_short, arg_long, **arg_opts)
        except ValueError:
            arg_long, arg_opts = arg_definition
            parser.add_argument(arg_long, **arg_opts)
    return parser.parse_args()


def get_parse_args_definitions(wanted=None):
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
                'required': False, 'help': 'command to execute Kolibri cli'
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
                'required': False, 'choices': ['large', 'multiple', 'video', 'exercise'],
                'help': 'Channels to use in Kolibri: large (1 large channel ~ 1Gb),\n'
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

    if wanted:
        return dict((k, definitions[k]) for k in wanted if k in definitions)

    return definitions

def add_timestamp(url, first=False):
    time_token = str(time.time()).replace('.', '')[:13]
    separator = '?' if first else '&'
    new_url = '{url}{separator}{timestamp}={timestamp}'.format(
        url=url, separator=separator, timestamp=time_token)
    return new_url
