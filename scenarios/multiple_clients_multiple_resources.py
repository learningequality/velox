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
import json
import random
import time

from locust import HttpLocust, TaskSet, task


try:
    from test_scaffolding import launch
except ImportError:
    # the test is being run out of velox environment
    # and velox package is not installed
    import os
    import sys
    sys.path.append(os.path.join(os.getcwd(), 'src'))
    from test_scaffolding import launch


class UserBehavior(TaskSet):

    def on_start(self):
        # assume all users arrive at the index page
        self.index_page()

    def index_page(self):
        r = self.client.get("/learn/#/recommended")
        self.csrf_token = r.cookies['csrftoken']

        time_token = str(time.time()).replace('.', '')[:13]
        get_popular_url = 'api/contentnode/?popular=true&{}={}'.format(time_token, time_token)
        r = self.client.get(get_popular_url, headers={'X-CSRFToken': self.csrf_token})
        try:
            content = json.loads(r.content)
            self.urls = ['/learn/#/recommended/{}'.format(url['id']) for url in content]
            import ipdb;ipdb.set_trace()
        except ValueError:
            #  bad response from the server
            self.urls = []

    @task(1)
    def get_something_else(self):
        self.client.get('/learn/#/recommended')

    @task(30)
    def load_sub_page(self):
        url = random.choice(self.urls)
        self.client.get(url)


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    # don't wait, hit the server as fast as you can:
    min_wait = 0
    max_wait = 0


def run(base_url='http://kolibridemo.learningequality.org', users=3):
    launch(WebsiteUser, base_url, users, 10)


if __name__ == '__main__':
    run()
