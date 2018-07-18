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
from locust import HttpLocust, task

try:
    from lib.locust.user import KolibriUserBehavior, AdminUser
    from lib.locust.wrapper import launch
except ImportError:
    # the test is being run out of velox environment
    # and velox package is not installed
    import os
    import sys
    sys.path.append(os.path.join(os.getcwd(), 'src'))
    from lib.locust.user import KolibriUserBehavior, AdminUser
    from lib.locust.wrapper import launch


class UserBehavior(KolibriUserBehavior):

    @task
    def load_html5_resources(self):
        self.load_resource('html5')

    @task
    def load_exercise_resources(self):
        self.load_resource('exercise')


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 0
    max_wait = 0


def run(base_url='http://kolibridemo.learningequality.org', learners=3):
    rate = 10
    admin = AdminUser(base_url=base_url)
    KolibriUserBehavior.KOLIBRI_USERS = admin.get_users()
    resources = admin.get_resources()
    exercise = [] if not resources['exercise'] else resources['exercise']
    html5 = [] if not resources['html5'] else resources['html5']
    KolibriUserBehavior.KOLIBRI_RESOURCES = {'video': [], 'html5': html5, 'document': [], 'exercise': exercise}
    launch(WebsiteUser, base_url, learners, rate, run_time=30)


if __name__ == '__main__':
    run()
