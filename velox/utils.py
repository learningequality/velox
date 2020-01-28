# -*- coding: utf-8 -*-
"""
Common function used by different parts of the application
"""
import argparse
import logging
import sys
import time
import traceback
from datetime import datetime
from datetime import timedelta
from typing import Any
from typing import Dict
from typing import List
from typing import Mapping
from typing import Optional

__all__ = [
    "calculate_duration",
    "enable_log_to_stdout",
    "get_config_opts",
    "show_error",
    "add_timestamp",
]


def enable_log_to_stdout(logname: str) -> logging.Logger:
    """Given a log name, outputs > INFO to stdout."""
    log = logging.getLogger(logname)
    log.setLevel(logging.DEBUG)
    handler = logging.StreamHandler()
    handler.setLevel(logging.DEBUG)
    # create formatter:
    formatter = logging.Formatter(
        "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
    )
    handler.setFormatter(formatter)
    log.addHandler(handler)
    return log


def calculate_duration(start: datetime) -> float:
    """
    Returns the difference in seconds between start and now
    :param: start: datetime to begin
    :returns: Seconds between start and end
    """
    timing: timedelta = datetime.utcnow() - start
    duration: float = timing.seconds + timing.microseconds / 1000000.0
    return duration


def show_error(logger: logging.Logger, error: Exception, message: str = ""):
    error_text: str = str(error)
    if message:
        error_text = "{} {}".format(error_text, message)
    logger.error(error_text)
    traceback.print_exc(file=sys.stdout)


def get_config_opts(wanted: List[Optional[str]], **kwargs: str) -> argparse.Namespace:
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
    opts: argparse.Namespace = fill_parse_args(wanted, **kwargs)
    args_definitions: Dict[str, List] = get_parse_args_definitions()

    # We assume that all the options are listed in the `get_default_args` function
    opt_key: str
    default_value: Any
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
                args_conf: Optional[Any] = args_definitions[opt_key][2]
            except KeyError:
                # And try one more time if the short arg format was not used
                args_conf = args_definitions[opt_key][1]
            except Exception:
                args_conf = None

            if (
                args_conf
                and "choices" in args_conf
                and getattr(opts, opt_key) not in args_conf["choices"]
            ):
                raise ValueError(
                    "{} is expected to be one of [{}]".format(
                        opt_key, ", ".join(args_conf["choices"])
                    )
                )

    return opts


def get_default_args() -> Dict[str, Any]:
    return {
        "learners": 30,
        "test": "all",
        "iterations": 3,
        "url": "http://127.0.0.1:8080",
    }


def fill_parse_args(wanted: List[Optional[str]], **kwargs: str):
    """
    Create the setup to parse args for the application scripts
    :param: wanted: list of args the application will use
    :returns: A parser object to be used by the script
    """
    if not wanted:
        wanted = [
            kwargs.get("wanted"),
        ]
    description: Optional[str] = kwargs.get("description", None)

    parser: argparse.ArgumentParser = argparse.ArgumentParser(description)
    args_definitions: Dict[str, List] = get_parse_args_definitions(wanted)

    for _, arg_definition in args_definitions.items():
        try:
            arg_short: str
            arg_long: str
            arg_opts: Mapping[str, str]
            arg_short, arg_long, arg_opts = arg_definition
            parser.add_argument(arg_short, arg_long, **arg_opts)
        except ValueError:
            arg_long, arg_opts = arg_definition
            parser.add_argument(arg_long, **arg_opts)
    return parser.parse_args()


def get_parse_args_definitions(
    wanted: Optional[List[Optional[str]]] = None,
) -> Dict[str, List]:
    """
    Parse the args the script neeeds
    :param: wanted: list of args the application will use
    :returns: A list with the options for the wanted args
    """
    definitions = {
        "learners": [
            "-l",
            "--learners",
            {
                "required": False,
                "type": int,
                "help": "Number of learners per classroom that will use the tests",
            },
        ],
        "test": [
            "-t",
            "--test",
            {
                "required": False,
                "help": 'Name of the test to be run (or "all" to run them all)',
            },
        ],
        "iterations": [
            "-i",
            "--iterations",
            {
                "required": False,
                "type": int,
                "help": "Number of times each test will be run",
            },
        ],
        "url": [
            "-u",
            "--url",
            {"required": False, "type": str, "help": "Url of the server to be tested"},
        ],
    }

    if wanted:
        return dict((k, definitions[k]) for k in wanted if k in definitions)

    return definitions


def add_timestamp(url: str, first: bool = False) -> str:
    time_token: str = str(time.time()).replace(".", "")[:13]
    separator: str = "?" if first else "&"
    new_url: str = "{url}{separator}{timestamp}={timestamp}".format(
        url=url, separator=separator, timestamp=time_token
    )
    return new_url
