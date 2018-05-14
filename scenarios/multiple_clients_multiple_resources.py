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


def add_timestamp(url, first=False):
    time_token = str(time.time()).replace('.', '')[:13]
    separator = '?' if first else '&'
    new_url = '{url}{separator}{timestamp}={timestamp}'.format(url=url, separator=separator, timestamp=time_token)
    return new_url


def filter_contents(contents, kind, extension):
    resources = [content['files'] for content in contents if content['kind'] == kind]
    filtered = [file['download_url'] for resource in resources for file in resource if file['extension'] == extension]
    return filtered


class UserBehavior(TaskSet):

    def on_start(self):
        # initial login to fetch info:
        r = self.client.get('/user/')
        self.csrf_token = r.cookies['csrftoken']
        self.session_id = r.cookies['sessionid']
        self.urls = []
        self.videos = []
        self.html5 = []
        self.documents = []
        self.exercises = []
        self.kolibri_users = []
        self.get_content()

        if self.log_in('admin', 'admin'):
            self.kolibri_users = self.get_kolibri_users()

        # logout:
        self.client.delete('/api/session/current/', headers={'X-CSRFToken': self.csrf_token})
        # get session info to login with random user:
        r = self.client.get('/user/')
        self.csrf_token = r.cookies['csrftoken']
        self.session_id = r.cookies['sessionid']
        if self.kolibri_users:
            self.user = random.choice(self.kolibri_users)
            self.log_in(self.user['username'], '', self.user['facility'])

    def log_in(self, username, password, facility=None):
        login_url = '/api/session/'

        data = {'username': username, 'password': password}
        if facility:
            data['facility'] = facility
        self.headers = {'X-CSRFToken': self.csrf_token,
                        'Cookie': 'sessionid={session_id}'.format(session_id=self.session_id)}
        r = self.client.post(login_url, data=data, headers=self.headers)
        # received new session data
        self.csrf_token = r.cookies['csrftoken']
        self.session_id = r.cookies['sessionid']
        self.headers = {'X-CSRFToken': self.csrf_token,
                        'Cookie': 'sessionid={session_id}'.format(session_id=self.session_id)}
        return r.status_code == 200

    def get_kolibri_users(self):
        r = self.client.get('/api/facilityuser/')
        # users with coach or admin role need password to login:
        return [{'username': u['username'], 'id':u['id'], 'facility':u['facility']}
                for u in json.loads(r.content) if u['roles'] == []]

    def get_content(self):
        r = self.client.get('/learn/#/recommended')
        get_popular_url = add_timestamp('/api/contentnode/?popular=true')
        r = self.client.get(get_popular_url, headers={'X-CSRFToken': self.csrf_token})

        try:
            contents = json.loads(r.content)
            self.urls = ['/learn/#/recommended/{}'.format(url['pk']) for url in contents]
            self.videos = filter_contents(contents, 'video', 'mp4')
            self.html5 = filter_contents(contents, 'html5', 'zip')
            self.documents = filter_contents(contents, 'document', 'pdf')
            self.exercises = filter_contents(contents, 'exercise', 'perseus')
        except ValueError:
            #  bad response from the server
            pass

    def load_resource(self, resource, with_timestamp=False):
        if resource:
            url = random.choice(resource)
            if with_timestamp:
                url = add_timestamp(url)
            self.client.get(url)

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


# def run(base_url='http://kolibribeta.learningequality.org', learners=25):
def run(base_url='http://127.0.0.1:8000', learners=25):
    # rate= 5
    # total number of requests=100
    launch(WebsiteUser, base_url, learners, 5, 100, timeout=30)


if __name__ == '__main__':
    run()
