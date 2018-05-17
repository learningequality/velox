# -*- coding: utf-8 -*-
"""
Experiment scenario 5
Opening exercises bundles is slow

Endpoints:
* HTML5 content endpoint (Phet simulations).
    * /learn/#/topics/c/{id}
        * → Kolibri Demo 1 → Science → Physics → Springs and Hooke's law
          → Hooke's Law
* Perseus exercise endpoint (Khan Academy exercises)
    * /learn/#/topics/{id}


Channels    Learners        Classrooms     Requests/s   Database
================================================================
Exercise       25               2              20        sqlite
Video          25               2             100        sqlite
Exercise       25               2              20        sqlite
Video          25               2             100        sqlite
"""
from __future__ import print_function, unicode_literals

from locust import HttpLocust, TaskSet, task

try:
    from locust_wrapper import launch
except ImportError:
    # the test is being run out of velox environment
    # and velox package is not installed
    import os
    import sys
    sys.path.append(os.path.join(os.getcwd(), 'src'))
    from locust_wrapper import launch


class UserBehavior(TaskSet):

    @task(1)
    def get_something_else(self):
        self.client.get('/')


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 0
    max_wait = 0


def run(base_url='http://kolibridemo.learningequality.org', users=3):
    launch(WebsiteUser, base_url, users, 3)


if __name__ == '__main__':
    run()
