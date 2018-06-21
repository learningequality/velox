# -*- coding: utf-8 -*-
"""
Testing / temporary scenario 2
"""
from __future__ import print_function, unicode_literals
import os
from locust import HttpLocust, task


try:
    from lib.locust.user import KolibriUserBehavior, AdminUser
    from lib.locust.wrapper import launch
except ImportError:
    import sys
    sys.path.append(os.path.join(os.getcwd(), 'src'))
    from lib.locust.user import KolibriUserBehavior, AdminUser
    from lib.locust.wrapper import launch

admin = AdminUser(base_url=os.environ.get('KOLIBRI_BASE_URL', 'http://127.0.0.1:8000'))
KolibriUserBehavior.KOLIBRI_USERS = admin.get_users()
KolibriUserBehavior.KOLIBRI_RESOURCES = admin.get_resources()


class UserBehavior(KolibriUserBehavior):

    @task(3)
    def browse_resources(self):
        self.browse_resource()

    @task(4)
    def load_video_resources(self):
        self.load_resource('video')

    @task(5)
    def load_html5_resources(self):
        self.load_resource('html5')

    @task(2)
    def load_document_resources(self):
        self.load_resource('document')

    @task(3)
    def load_exercise_resources(self):
        self.load_resource('exercise')


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    # don't wait, hit the server as fast as you can:
    min_wait = 0
    max_wait = 0


def on_request_failure(request_type, name, response_time, response_length):
    """
    Event handler that get triggered on every successful request
    """
    print(request_type)


def run(learners=30):
    rate = 5
    launch(WebsiteUser, learners, rate, run_time=60)


if __name__ == '__main__':
    run()
