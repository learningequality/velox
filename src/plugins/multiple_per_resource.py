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

from locust import HttpLocust, TaskSet, task

from test_scaffolding import launch


class UserBehavior(TaskSet):

    @task(2)
    def get_something(self):
        self.client.get("/learn/#/recommended")

    @task(1)
    def get_something_else(self):
        self.client.get("/")


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 0
    max_wait = 0


def run(base_url='http://kolibridemo.learningequality.org', users=3):
    launch(WebsiteUser, base_url, users, 3)

if __name__ == '__main__':
    run()
