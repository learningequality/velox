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

import random
from locust import HttpLocust, task

try:
    from locust_user import KolibriUserBehavior, AdminUser
    from locust_wrapper import launch
except ImportError:
    # the test is being run out of velox environment
    # and velox package is not installed
    import os
    import sys
    sys.path.append(os.path.join(os.getcwd(), 'src'))
    from locust_user import KolibriUserBehavior, AdminUser
    from locust_wrapper import launch


class UserBehavior(KolibriUserBehavior):

    @task
    def load_exercise_resources(self):
        self.load_resource('exercise')
        self.load_resource('document')
        self.load_resource('video')
        self.load_resource('html5')


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    # don't wait, hit the server as fast as you can:
    min_wait = 0
    max_wait = 0


def run(base_url='http://127.0.0.1:8000', learners=1):
    rate = 5
    n_requests = 20
    admin = AdminUser(base_url=base_url)
    KolibriUserBehavior.KOLIBRI_USERS = admin.get_users()
    resources = admin.get_resources()
    video = [] if not resources['video'] else [random.choice(resources['video'])]
    html5 = [] if not resources['html5'] else [random.choice(resources['html5'])]
    document = [] if not resources['document'] else [random.choice(resources['document'])]
    exercise = [] if not resources['exercise'] else [random.choice(resources['exercise'])]
    KolibriUserBehavior.KOLIBRI_RESOURCES = {'video': video, 'html5': html5, 'document': document, 'exercise': exercise}
    launch(WebsiteUser, base_url, learners, rate, n_requests, timeout=30)


if __name__ == '__main__':
    run()
