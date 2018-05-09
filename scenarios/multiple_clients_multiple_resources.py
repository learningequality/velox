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


def add_timestamp(url):
    time_token = str(time.time()).replace('.', '')[:13]
    new_url = '{url}&{timestamp}={timestamp}'.format(url=url, timestamp=time_token)
    return new_url


def filter_contents(contents, kind, extension):
    resources = [content['files'] for content in contents if content['kind'] == kind]
    filtered = [file['download_url'] for resource in resources for file in resource if file['extension'] == extension]
    return filtered


class UserBehavior(TaskSet):

    def on_start(self):
        # request '/' to get the initial cookies
        r = self.client.get('/')
        self.csrf_token = r.cookies['csrftoken']
        self.session_id = r.cookies['sessionid']
        self.urls = []
        self.videos = []
        self.html5 = []
        self.documents = []
        self.exercises = []
        self.get_content()
        if self.log_in('admin', 'admin'):
            self.kolibri_usernames = self.get_kolibri_usernames()
            # assume all users arrive at the index page

    def log_in(self, username, password):
        login_url = '/api/session/'
        data = {'username': username, 'password': password}
        headers = {'X-CSRFToken': self.csrf_token,
                   'Cookie': 'sessionid={session_id}'.format(session_id=self.session_id)}
        r = self.client.post(login_url, data=data, headers=headers)
        return r.status_code == 200

    def get_kolibri_usernames(self):
        r = self.client.get('/api/facilityuser/')
        return [u['username'] for u in json.loads(r.content)]

    def get_content(self):
        r = self.client.get('/learn/#/recommended')
        get_popular_url = add_timestamp('/api/contentnode/?popular=true')
        r = self.client.get(get_popular_url, headers={'X-CSRFToken': self.csrf_token})

        try:
            contents = json.loads(r.content)
            self.urls = ['/learn/#/recommended/{}'.format(url['pk']) for url in contents]
            # video_resources = [content['files'] for content in contents if content['kind'] == 'video']
            # self.videos = [file['download_url'] for resource in video_resources for file in resource if file['extension'] == 'mp4']
            self.videos = filter_contents(contents, 'video', 'mp4')
            self.html5 = filter_contents(contents, 'html5', 'zip')
            self.documents = filter_contents(contents, 'document', 'pdf')
            self.exercises = filter_contents(contents, 'exercise', 'perseus')
        except ValueError:
            #  bad response from the server
            pass

    @task(30)
    def load_learn_pages(self):
        url = random.choice(self.urls)
        self.client.get(add_timestamp(url))

    @task(40)
    def load_video_resources(self):
        url = random.choice(self.videos)
        self.client.get(url)

    @task(50)
    def load_html5_resources(self):
        url = random.choice(self.html5)
        self.client.get(url)

    @task(20)
    def load_document_resources(self):
        url = random.choice(self.documents)
        self.client.get(url)

    @task(30)
    def load_exercise_resources(self):
        url = random.choice(self.exercises)
        self.client.get(url)


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    # don't wait, hit the server as fast as you can:
    min_wait = 0
    max_wait = 0


def run(base_url='http://kolibridemo.learningequality.org', users=30):
    launch(WebsiteUser, base_url, users, 5)


if __name__ == '__main__':
    run()
