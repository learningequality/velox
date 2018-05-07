# -*- coding: utf-8 -*-
"""
This is an example of test using locust.io to tests kolibri demo server
To use locust:
1. A class inherited from HttpLocust must be created with the endpoints to use
2. A run function must exists
3. run function must execute the launch function from the test_scaffolding module

Velox will load this module and will execute the run function.
"""
from __future__ import print_function, unicode_literals

from locust import HttpLocust, TaskSet, task

from test_scaffolding import launch


class UserBehavior(TaskSet):

    @task(2)
    def get_something(self):
        self.client.get('/learn/#/recommended')

    @task(1)
    def get_something_else(self):
        self.client.get('/')


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 0
    max_wait = 0


def run(base_url='http://kolibridemo.learningequality.org', users=1):
    # launch(classname, base_url, n_clients, rate, timeout=600):
    launch(WebsiteUser, base_url, users, 1)


if __name__ == '__main__':
    run()
