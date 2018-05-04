# -*- coding: utf-8 -*-
"""
Common code for the tests.
All tests using locust.io will need to create a HttpLocust class and run
the tests doing:

    from test_scaffolding import launch
    launch(classname, n_clients, rate, run_time):

"""
from __future__ import print_function, unicode_literals


import gevent

from argparse import Namespace
from locust.runners import LocalLocustRunner
from locust import events, runners
from locust.stats import print_error_report, print_percentile_stats, print_stats, write_stat_csvs
from locust.log import setup_logging


def launch(classname, n_clients, rate, timeout=600):
    """
    Launches the tests
    :param: classname: class inherited from HttpLocust defining the test
    :param: n_clients: Number of concurrent users
    :param: rate: The rate per second in which clients are spawned
    :param: timeout: Stop testing after the specified amount of seconds
    """
    def spawn_run_time_limit_greenlet():
        """
        To stop each test gevent greenlet after timeout passes
        """
        def timelimit_stop():
            runners.locust_runner.stop()
        gevent.spawn_later(options.run_time, timelimit_stop)

    def shutdown(code=0):
        """
        Shut down locust by firing quitting event, printing/writing stats and exiting
        """
        if runners.locust_runner is not None:
            runners.locust_runner.stop()

        events.quitting.fire(reverse=True)
        print_stats(runners.locust_runner.request_stats)
        print_percentile_stats(runners.locust_runner.request_stats)
        if options.csvfilebase:
            write_stat_csvs(options.csvfilebase)
        print_error_report()

    options = Namespace()
    options.host = "http://localhost"
    options.num_clients = n_clients
    options.hatch_rate = rate
    options.num_requests = n_clients * 10
    options.run_time = timeout
    options.no_web = True
    options.csvfilebase = None
    options.no_reset_stats = True

    setup_logging('INFO', None)
    runners.locust_runner = LocalLocustRunner([classname], options)
    # spawn client spawning/hatching greenlet
    runners.locust_runner.start_hatching(wait=True)
    main_greenlet = runners.locust_runner.greenlet
    spawn_run_time_limit_greenlet()

    try:
        main_greenlet.join()
        code = 0
        if len(runners.locust_runner.errors):
            code = 1
        shutdown(code=code)
    except KeyboardInterrupt:
        shutdown(0)
