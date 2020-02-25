#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Performance testing launcher script.
Execution examples:
Using a pex file:
    python src/velox.py -c video -ke /datos/le/kolibri-v0.9.1.pex -l 30
    python src/velox.py -c video -ke /datos/le/kolibri-v0.9.1.pex -l 5 -t example
Having kolibri installed in the system:
    python src/velox.py -c video
From development environment:
    python src/velox.py -c video -kv /datos/le/kolibri/venv/  -kd /datos/le/kolibri -l 10 -s 2
    or
    python src/velox.py -c exercise -kv /datos/le/kolibri/venv/  -kd /datos/le/kolibri -l 10 -s 2 -d postgresql
    to use postgresql database

IMPORTANT NOTES:
    * Tests are fetched from the scenarios directory.
    * Tests need to have a 'run' function that will be executed to run the test.
    * If no test is passed using the command line args all the tests in the directory will be run.
    * Every test is run three times and the execution times are logged at the end of the process.

"""
import gevent.monkey

# Above and below  two lines are needed to workaround the problem caused by the
# combination of requests bug #3831 with urllib3 bug #1104

gevent.monkey.patch_all()  # noqa

import argparse
import logging
import os
import sys
import tempfile

from datetime import datetime
from filelock import FileLock
from importlib import import_module
from typing import Any, Dict, List

from utils import (
    calculate_duration,
    enable_log_to_stdout,
    get_config_opts,
    show_error,
)


class EnvironmentSetup(object):

    """
    Main object centralizing all the needed tasks to setup the environment

    :param: opts: Args passed through when calling the script from the command line
    :param: logger: Object to log events during the execution
    """

    def __init__(self, opts: argparse.Namespace, logger: logging.Logger):
        # They all are reasonable in this case.
        self.opts = opts
        self.logger = logger
        temp_dir: str = tempfile.mkdtemp()
        self.logger.info("Created temp working directory: {}".format(temp_dir))

    def load_tests(self):
        """
        If a test name is passed as an argument it returns its module.
        If not, it will return all the modules for all the tests available
        inside the scenarios directory.
        """

        def load_test(test_name: str) -> Any:
            """
            Returns the module in scenarios directory named test_name
            :param: test_name: Name of test file in the scenarios directory
            :returns: Loaded python module
            """
            real_test_name: str = test_name
            if test_name.lower().endswith(".py"):
                real_test_name = test_name[:-3]
            module: Any = import_module(real_test_name)
            return module

        if self.opts.test != "all":
            yield load_test(self.opts.test)
        else:
            # plugins_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'plugins')
            locust_tests_path: str = "locust"
            entries: List = os.listdir(locust_tests_path)
            blacklisted: List = ["__init__.py", "example.py"]
            for entry in entries:
                if entry not in blacklisted and entry.endswith(".py"):
                    yield load_test(entry)
                else:
                    continue


if __name__ == "__main__":
    start_date = datetime.utcnow()
    wanted_args: List[str] = ["iterations", "learners", "test", "url"]
    opts = get_config_opts(wanted=wanted_args, description="Velox setup script")
    log_name = "setup_tests"
    logger: logging.Logger = enable_log_to_stdout(log_name)
    tests_durations: Dict[str, List[int]] = {}
    # add locust directory to the sys path:
    for path in ["locust", ".", ".."]:
        sys.path.append(os.path.join(os.getcwd(), path))
    with FileLock("{}.lock".format(log_name)):
        try:
            logger.info("Tests setup script started")
            es = EnvironmentSetup(opts, logger)
            os.environ["KOLIBRI_BASE_URL"] = es.opts.url
            for test in es.load_tests():
                # Each test is done three times
                tests_durations[test.__name__] = []
                for i in range(opts.iterations):
                    test_start = datetime.utcnow()
                    logger.info(
                        "{n} - Running test {test_name}".format(
                            n=i + 1, test_name=test.__name__
                        )
                    )

                    # Actual test execution:
                    try:
                        test.run(opts.learners)
                    except AttributeError:
                        logger.error(
                            "{} is not a correct module to run tests".format(
                                test.__name__
                            )
                        )
                        # Clean temp files and quit velox:
                    except Exception as error:
                        show_error(
                            logger, error, "when trying to run {}".format(test.__name__)
                        )
                    tests_durations[test.__name__].append(
                        calculate_duration(test_start)
                    )
            duration = calculate_duration(start_date)
            logger.info("::Duration {}".format(duration))
            logger.info("Tests finished")
            if tests_durations:
                logger.info("These are the tests durations:")
                logger.info(tests_durations)

        except Exception as error:
            show_error(logger, error)
