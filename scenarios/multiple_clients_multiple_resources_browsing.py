# -*- coding: utf-8 -*-
from __future__ import print_function, unicode_literals
import os
from locust import HttpLocust, task


try:
    from locust_user import KolibriUserBehavior, AdminUser
    from locust_wrapper import launch
except ImportError:
    # the test is being run out of velox environment
    # and velox package is not installed
    import sys
    sys.path.append(os.path.join(os.getcwd(), 'src'))
    from locust_user import KolibriUserBehavior, AdminUser
    from locust_wrapper import launch

# TODO: this needs to be refactored!
admin = AdminUser(base_url=os.environ.get('KOLIBRI_BASE_URL', 'http://127.0.0.1:8000'))
KolibriUserBehavior.KOLIBRI_USERS = admin.get_users()
KolibriUserBehavior.KOLIBRI_RESOURCES = admin.get_resources()


class UserBehavior(KolibriUserBehavior):

    @task(1)
    def browse_resources(self):
        self.browse_resource()

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 0
    max_wait = 0


def run(learners=30):
    rate = 40
    launch(WebsiteUser, learners, rate, run_time=120)


if __name__ == '__main__':
    run()
