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
import sys
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
    return inspect.getmodulename(frame_records[1])


def get_csv_filename():
    """
    Returns the filename for the csv stats export
    :returns: A string with the filename for the csv stats export
    """
    calling_module = get_test_calling()
    timestamp = datetime.datetime.now().strftime('%Y_%m_%d__%H_%M_%S__%f')
    return '{timestamp}_{mod}'.format(mod=calling_module, timestamp=timestamp)


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
        'csvfilebase': os.path.join(get_or_create_output_dir(), get_csv_filename())
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
    new_url = '{url}{separator}{timestamp}={timestamp}'.format(
        url=url, separator=separator, timestamp=time_token)
    return new_url


def get_content_resources(contents, kind):
    resources = [{'content_id': content['id'],
                  'channel_id': content['channel_id'],
                  'files':[file['download_url']
                           for file in content['files']]} for content in contents if content['kind'] == kind]
    return resources


class KolibriUserBehavior(TaskSet):

    ADMIN_USERNAME = 'admin'
    ADMIN_PASSWORD = 'admin'

    def on_start(self):
        self.kolibri_users = []
        self.current_user = None
        self.headers = self.get_headers()
        self.resources = self.get_resources()
        # log in (and log out) with admin user to be able to get the list of all kolibri users
        if self.log_in(KolibriUserBehavior.ADMIN_USERNAME, KolibriUserBehavior.ADMIN_PASSWORD):
            self.kolibri_users = self.get_kolibri_users()
            self.log_out()

        if self.kolibri_users:
            self.current_user = random.choice(self.kolibri_users)
            print('Current user: {}'.format(self.current_user['username']))
            self.log_in(self.current_user['username'], facility=self.current_user['facility'])
        else:
            # TODO: add appropiate logging
            print('No learners to run the tests. At least 1 admin + 1 coach + 1 learner are needed')
            sys.exit(1)

    def log_in(self, username, password=None, facility=None):
        data = {'username': username}

        if password:
            data['password'] = password
        if facility:
            data['facility'] = facility

        r = self.client.post('/api/session/', data=data, headers=self.headers)

        # update headers with the new set of entries
        self.set_headers({'X-CSRFToken': r.cookies['csrftoken'],
                          'Cookie': 'sessionid={session_id}; csrftoken={csrf_token}'.format(
                              session_id=r.cookies['sessionid'],
                              csrf_token=r.cookies['csrftoken'])})

        return r.status_code == 200

    def log_out(self):
        r = self.client.delete('/api/session/current/', headers=self.headers)
        return r.status_code == 200

    def get_headers(self):
        r = self.client.get('/user/')
        self.csrf_token = r.cookies['csrftoken']
        self.session_id = r.cookies['sessionid']

        cookie_header = 'sessionid={session_id}; csrftoken={csrf_token}'.format(
            session_id=self.session_id, csrf_token=self.csrf_token)
        return {'X-CSRFToken': self.csrf_token, 'Cookie': cookie_header}

    def set_headers(self, headers):
        self.headers = headers

    def get_kolibri_users(self):
        r = self.client.get('/api/facilityuser/')
        # users with coach or admin role need password to login:
        return [{'username': u['username'], 'id':u['id'], 'facility':u['facility']}
                for u in json.loads(r.content) if u['roles'] == []]

    def get_resources(self):
        resources = {'video': [], 'html5': [], 'document': [], 'exercise': []}
        r = self.client.get(add_timestamp('/api/contentnode/?popular=true'), headers=self.headers)

        try:
            contents = json.loads(r.content)
            for kind in resources.keys():
                resources[kind] = get_content_resources(contents, kind)
        except ValueError:
            #  bad response from the server
            pass
        finally:
            return resources

    def load_resource(self, kind, with_timestamp=False):
        if self.resources[kind]:
            resource = random.choice(self.resources[kind])
            # less fetch all the resources:
            for file_url in resource['files']:
                if with_timestamp:
                    file_url = add_timestamp(file_url)
                self.client.get(file_url)
            self.do_logging(resource['content_id'], resource['channel_id'], kind)

    def do_logging(self, content_id, channel_id, kind):
        self.do_contentsessionlog(content_id, channel_id, kind)
        self.do_contentsummarylog(content_id, channel_id, kind)

    def do_contentsessionlog(self, content_id, channel_id, kind):
        log_url = '/api/contentsessionlog/'

        # create POST request to get the log pk
        timestamp = datetime.datetime.now().strftime('%Y-%m-%dT%H:%M:%S.%fZ')
        data = {
            'channel_id': channel_id,
            'content_id': content_id,
            'end_timestamp': timestamp,
            'extra_fields': '{}',
            'kind': kind,
            'progress': 0,
            'start_timestamp': timestamp,
            'time_spent': 0,
            'user': self.current_user['id']
        }
        r = self.client.post(add_timestamp(log_url, first=True), data=data, headers=self.headers)
        if not r.status_code == 201:
            return False

        # create PATCH request to update the log
        data['pk'] = json.loads(r.content)['pk']
        log_url_patch = '{log_url}{log_pk}/'.format(log_url=log_url, log_pk=data['pk'])
        r = self.client.patch(log_url_patch, data=data, headers=self.headers)

        return r.status_code == 200

    def do_contentsummarylog(self, content_id, channel_id, kind):
        log_url = '/api/contentsummarylog/'

        # set general data object
        timestamp = datetime.datetime.now().strftime('%Y-%m-%dT%H:%M:%S.%fZ')
        data = {
            'channel_id': channel_id,
            'content_id': content_id,
            'end_timestamp': timestamp,
            'extra_fields': '{}',
            'kind': kind,
            'progress': 0,
            'start_timestamp': timestamp,
            'time_spent': 0,
            'user': self.current_user['id'],
            'completion_timestamp': None,
            'currentmasterylog': None
        }

        # create a GET request to check if log already exists
        log_url_get = '{log_url}?content_id={content_id}&user_id={user_id}'.format(
            log_url=log_url, content_id=content_id, user_id=self.current_user['id'])
        r = self.client.get(add_timestamp(log_url_get))
        if not r.status_code == 200:
            return False

        contents = json.loads(r.content)
        if len(contents) > 0:
            # extract log pk from the GET response
            log_pk = contents[0]['pk']
        else:
            # create summarylog if it doesn't exists yet
            r = self.client.post(add_timestamp(log_url, first=True), data=data, headers=self.headers)
            if not r.status_code == 201:
                return False
            log_pk = json.loads(r.content)['pk']

        # create PATCH request to update the log
        data['pk'] = log_pk
        log_url_patch = '{log_url}{log_pk}/'.format(log_url=log_url, log_pk=log_pk)
        r = self.client.patch(log_url_patch, data=data, headers=self.headers)

        return r.status_code == 200
