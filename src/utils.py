# -*- coding: utf-8 -*-
"""
Common function used by different parts of the application
"""

import argparse
import logging
import socket
import sys
import time
import typing
import traceback

from datetime import datetime
from locust import HttpLocust
from locust.main import load_locustfile
from pathlib import Path
from typing import List

if sys.version_info < (3, 5):
    raise Exception('Python >= 3.5 is needed to use this utils module')

__all__ = ['calculate_duration', 'enable_log_to_stdout', 'get_config_opts',
           'get_free_tcp_port', 'show_error', 'add_timestamp', 'parse_locustfile']


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


def get_free_tcp_port():
    """
    Find a free tcp port to run Kolibri server
    """
    tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tcp.bind(('', 0))
    _, port = tcp.getsockname()
    tcp.close()
    return port


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
    """
    try:
        from settings import config
    except ImportError:
        config = None

    # Get command line arguments with the argparse module
    opts = fill_parse_args(wanted, **kwargs)
    # We assume that all the options are listed in the `get_default_args` function
    for opt_key in wanted:
        if not getattr(opts, opt_key, None):
            if config:
                try:
                    if opt_key == "users":
                        setattr(opts, opt_key, is_valid_file(config[opt_key]))
                    else:
                        setattr(opts, opt_key, config[opt_key])
                except KeyError:
                    pass

            # If opt is still not set, raise error
            if not getattr(opts, opt_key, None):
                raise Exception("Velox setup script: error: the following argument is required: {}".format(opt_key))

    return opts


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


def is_valid_file(arg: str) -> typing.TextIO:
    if not Path(arg).exists():
        raise Exception("The file %s does not exist!" % arg)
    else:
        return open(arg, 'r')  # return an open file handle

def get_parse_args_definitions(wanted=None):
    """
    Parse the args the script neeeds
    :param: wanted: list of args the application will use
    :returns: A list with the options for the wanted args
    """
    definitions = {
        'channel': [
            '-c', '--channel', {
                'required': False, 'choices': ['large', 'multiple', 'video', 'exercise'],
                'help': 'Channels to use in Kolibri: large (1 large channel ~ 1Gb),\n'
                        'multiple (10 x ~30 Mb channels), video (channel with multiple videos),\n'
                        'exercise (channel with multiple exercises)',
                'default': 'exercise'
            }
        ],
        'test': [
            '-t', '--test', {
                'required': False, 'help': 'Name of the test to be run (or "all" to run them all)'
            }
        ],
        'server': [
            '-s', '--server', {
                'required': False, 'type': str, 'help': 'Url of the server to be tested'
            }
        ],
        'iterations': [
            '-i', '--iterations', {
                'default': 3,
                'required': False, 'type': int, 'help': 'Number of times each test will be run'
            }
        ],
        'users': [
            '-u', '--users', {
                'required': False,
                'type': lambda x: is_valid_file(x),
                'help': 'File with user credentials, either username or username and password'
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


def parse_locustfile(locustfile: str) -> List[HttpLocust]:
    # if the file does not include the path, look for it in the scenarios folder:
    if not Path(locustfile).exists():
        locustfile = str(Path('scenarios').joinpath(locustfile))

    docstring, locusts = load_locustfile(locustfile)
    locust_classes = list(locusts.values())
    return locust_classes

class LocustOptions(object):
    def __init__(self):
        self.host = None
        self.web_host = ""
        self.port = 8089
        self.locustfile = "locustfile"
        self.master = False
        self.slave = False
        self.master_host = "127.0.0.1"
        self.master_port = 5557
        self.master_bind_host = "*"
        self.master_bind_port = 5557
        self.expect_slaves = 1
        self.no_web = False
        self.num_clients = 1
        self.hatch_rate = 1
        self.num_requests = None
        self.loglevel = 'INFO'
        self.logfile = None
        self.print_stats = False
        self.only_summary = False
        self.no_reset_stats = False
        self.list_commands = False
        self.show_task_ratio = False
        self.show_task_ratio_json = False
        self.heartbeat_liveness = 3  # set number of seconds before failed heartbeat from slave
        self.heartbeat_interval = 1  # set number of seconds delay between slave heartbeats to master
        self.show_version = False
