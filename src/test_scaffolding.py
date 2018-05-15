# -*- coding: utf-8 -*-
"""
Common code for the tests.
All tests using locust.io will need to create a HttpLocust class and run
the tests doing:

    from test_scaffolding import launch
    launch(classname, n_clients, rate, run_time):

"""
from __future__ import print_function, unicode_literals

import datetime
import gevent
import inspect
import json
import os
import random
import time

from argparse import Namespace
from locust.runners import LocalLocustRunner
from locust import events, runners
from locust import TaskSet
from locust.stats import print_error_report, print_percentile_stats, print_stats, write_stat_csvs, stats_writer
from locust.log import setup_logging


def spawn_run_time_limit_greenlet(options):
    """
    To stop each test gevent greenlet after timeout passes
    """
    def timelimit_stop():
        runners.locust_runner.stop()
    gevent.spawn_later(options.run_time, timelimit_stop)


def shutdown(options, code=0):
    """
    Shut down locust by firing quitting event, printing/writing stats and exiting
    """
    if runners.locust_runner is not None:
        runners.locust_runner.stop()

    events.quitting.fire(reverse=True)
    print_stats(runners.locust_runner.request_stats)
    print_percentile_stats(runners.locust_runner.request_stats)
    if options.csvfilebase:
        write_stat_csvs(options.csvfilebase)
    print_error_report()


def get_test_calling():
    """
    Finds out the name of the test being run
    :returns: A string with the name of the module importing this module
    """
    frame_records = inspect.stack()[2]
    calling_module = inspect.getmodulename(frame_records[1])
    timestamp = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%f")
    return '{mod}_{timestamp}'.format(mod=calling_module, timestamp=timestamp)


def get_or_create_output_dir():
    """
    Gets or creates output directory in which to store the locust reports
    """
    output_dir = os.path.join('output', 'locust')

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    return output_dir


def launch(classname, base_url, n_clients, rate, n_requests=None, timeout=600):
    """
    Launches the tests
    :param: classname: class inherited from HttpLocust defining the test
    :param: base_url: server and port of the url to request
    :param: n_clients: Number of concurrent users
    :param: rate: The rate per second in which clients are spawned
    :param: n_requests: Total number of requests to be done
    :param: timeout: Stop testing after the specified amount of seconds
    """
    options = Namespace(**{
        'host': base_url,
        'num_clients': n_clients,
        'hatch_rate': rate,
        'num_requests': n_requests if n_requests else n_clients * 10,
        'run_time': timeout,
        'no_web': True,
        'no_reset_stats': True,
        'csvfilebase': os.path.join(get_or_create_output_dir(), get_test_calling())
    })

    setup_logging('INFO', None)
    runners.locust_runner = LocalLocustRunner([classname], options)

    # spawn client spawning/hatching greenlets:
    runners.locust_runner.start_hatching(wait=True)
    main_greenlet = runners.locust_runner.greenlet
    spawn_run_time_limit_greenlet(options)

    if options.csvfilebase:
        gevent.spawn(stats_writer, options.csvfilebase)
    try:
        main_greenlet.join()
        code = 0
        if len(runners.locust_runner.errors):
            code = 1
        shutdown(options, code=code)
    except KeyboardInterrupt:
        shutdown(options, 0)


def add_timestamp(url, first=False):
    time_token = str(time.time()).replace('.', '')[:13]
    separator = '?' if first else '&'
    new_url = '{url}{separator}{timestamp}={timestamp}'.format(url=url, separator=separator, timestamp=time_token)
    return new_url


def get_resources(contents, kind):
    resources = [{'id': content['id'],
                  'channel_id': content['channel_id'],
                  'files':[file['download_url']
                           for file in content['files']]} for content in contents if content['kind'] == kind]
    return resources


def filter_contents(contents, kind, extension):
    resources = [content['files'] for content in contents if content['kind'] == kind]
    filtered = [file['download_url'] for resource in resources for file in resource if file['extension'] == extension]
    return filtered


class KolibriUserBehavior(TaskSet):

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
            print('****************\n\t\t\t\t\tUser:{}'.format(self.user['username']))
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
            self.videos = get_resources(contents, 'video')
            self.html5 = get_resources(contents, 'html5')
            self.documents = get_resources(contents, 'document')
            self.exercises = get_resources(contents, 'exercise')
        except ValueError:
            #  bad response from the server
            pass

    def do_logging(self, id, channel_id):
        pass

    def load_resource(self, resources, with_timestamp=False):
        if resources:
            resource = random.choice(resources)
            # less fetch all the resources:
            for file in resource['files']:
                url = random.choice(resource)
                if with_timestamp:
                    url = add_timestamp(url)
                self.client.get(url)
            self.do_logging(resource['id'], resource['channel_id'])
