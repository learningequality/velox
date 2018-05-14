# -*- coding: utf-8 -*-
"""
Experiment scenario 2
Server unresponsive when multiple clients access different resource

Endpoints (shared between the requests):
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
    from test_scaffolding import launch, KolibriUserBehavior
except ImportError:
    # the test is being run out of velox environment
    # and velox package is not installed
    import os
    import sys
    sys.path.append(os.path.join(os.getcwd(), 'src'))
    from test_scaffolding import launch, KolibriUserBehavior


class UserBehavior(KolibriUserBehavior):

    @task(30)
    def load_learn_pages(self):
        self.load_resource(self.urls, True)

    @task(40)
    def load_video_resources(self):
        self.load_resource(self.videos)

    @task(50)
    def load_html5_resources(self):
        self.load_resource(self.html5)

    @task(20)
    def load_document_resources(self):
        self.load_resource(self.documents)

    @task(30)
    def load_exercise_resources(self):
        self.load_resource(self.exercises)


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    # don't wait, hit the server as fast as you can:
    min_wait = 0
    max_wait = 0


def run(base_url='http://kolibribeta.learningequality.org', learners=25):
    # rate= 5
    # total number of requests=100
    launch(WebsiteUser, base_url, learners, 5, 100, timeout=30)


if __name__ == '__main__':
    run()
