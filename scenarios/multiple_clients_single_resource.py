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


Channels    Learners        Classrooms     Requests/s   Database
================================================================
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

from locust import HttpLocust, task


try:
    from locust_user import KolibriUserBehavior
    from locust_wrapper import launch
except ImportError:
    # the test is being run out of velox environment
    # and velox package is not installed
    import os
    import sys
    sys.path.append(os.path.join(os.getcwd(), 'src'))
    from locust_user import KolibriUserBehavior
    from locust_wrapper import launch


class UserBehavior(KolibriUserBehavior):

    @task
    def load_exercise_resources(self):
        self.load_resource('exercise')
        self.load_resource('video')
        self.load_resource('document')
        self.load_resource('html5')


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    # don't wait, hit the server as fast as you can:
    min_wait = 5000
    max_wait = 15000


def run(base_url='http://kolibribeta.learningequality.org', learners=25):
    # rate= 5
    # total number of requests=100
    launch(WebsiteUser, base_url, learners, 5, 100, timeout=30)


if __name__ == '__main__':
    run()
