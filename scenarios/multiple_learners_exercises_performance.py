# -*- coding: utf-8 -*-
"""
Experiment scenario 3
Individual student’s progress could slow down the exercises solving

Selenium (or cypress) answering an exercise:
* /coach/#/{id}/learners/{id}/{id}/item/{id}/0/0
* /learn/#/topics/c/88557704d182447f8c86f7a51181dc06
    * CK-12 Testing → Making 10 → Make 10 (grids and number bonds)
Endpoints:
* /learn/#/topics/{id} : JavaScript (Phet or similars) while Selenium is running.


Channels    Learners        Classrooms     Requests/s   Database
================================================================
Exercise       25               2              20        sqlite
Video          25               2              20        sqlite
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
    def load_video_resources(self):
        self.load_resource('video')

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
    video = [] if not resources['video'] else resources['video']
    KolibriUserBehavior.KOLIBRI_RESOURCES = {'video': video, 'html5': [], 'document': [], 'exercise': exercise}
    launch(WebsiteUser, base_url, learners, rate, run_time=30)


if __name__ == '__main__':
    run()
