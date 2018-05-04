# -*- coding: utf-8 -*-
"""
Experiment scenario 1
Server unresponsive when multiple clients access the same resource
Endpoints:
* /user/#/signin
* /facility/#/classes
* /learn/#/topics/{id} : video
* /learn/#/topics/{id} : pdf
* /learn/#/topics/{id} : JavaScript (Phet or similars)
* … exercises, exams, coach pages


PENDING: Need config for velox to run this test multiple times with different velox options
This experiment should be executed multiple times with different options ¿a yaml file passed to velox?

Channels    Learners        Classrooms     Requests/s   Database
No              25              2           20          sqlite
large           25              2           20          sqlite
video           25              2           20          sqlite
video           25              2           100         sqlite
video           25              2           100         postgresql
Multiple        25              2           20          sqlite
Multiple        25              2           100         sqlite
Multiple        25              2           100         postgresql
"""
from __future__ import print_function, unicode_literals


import gevent

from argparse import Namespace
from locust import HttpLocust, TaskSet, task
from locust.runners import LocalLocustRunner
from locust import events, runners
from locust.stats import print_error_report, print_percentile_stats, print_stats, write_stat_csvs
from locust.log import setup_logging


class UserBehavior(TaskSet):

    @task
    def get_something(self):
        self.client.get("/something")


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 0
    max_wait = 0


def run():

    def spawn_run_time_limit_greenlet():
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
    options.num_clients = 3
    options.hatch_rate = options.num_clients
    options.num_requests = options.num_clients * 10
    options.run_time = 60  # seconds
    options.no_web = True
    options.csvfilebase = None
    options.no_reset_stats = None

    setup_logging('INFO', None)
    runners.locust_runner = LocalLocustRunner([WebsiteUser], options)
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

if __name__ == '__main__':
    run()
