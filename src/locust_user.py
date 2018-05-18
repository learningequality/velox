# -*- coding: utf-8 -*-
"""
User class for the locust scenario runner
"""
from __future__ import print_function, unicode_literals

import json
import random
import requests
import sys

from datetime import datetime as dt
from locust import TaskSet
from utils import add_timestamp


class AdminUser(object):
    USERNAME = 'admin'
    PASSWORD = 'admin'

    def __init__(self, base_url):
        self.base_url = base_url
        self.headers = None

    def login_admin(self):
        data = {'username': AdminUser.USERNAME, 'password': AdminUser.PASSWORD}

        # users with coach or admin role need password to login:
        r = requests.get('{base_url}/user/'.format(base_url=self.base_url))
        csrf_token = r.cookies['csrftoken']
        session_id = r.cookies['sessionid']

        cookie_header = 'sessionid={session_id}; csrftoken={csrf_token}'.format(session_id=session_id,
                                                                                csrf_token=csrf_token)
        headers = {'X-CSRFToken': csrf_token, 'Cookie': cookie_header}

        r = requests.post('{base_url}/api/session/'.format(base_url=self.base_url), data=data, headers=headers)

        # update headers with the new set of entries
        self.headers = {'X-CSRFToken': r.cookies['csrftoken'],
                        'Cookie': 'sessionid={session_id}; csrftoken={csrf_token}'.format(
            session_id=r.cookies['sessionid'], csrf_token=r.cookies['csrftoken'])}

    def get_users(self):
        if not self.headers:
            self.login_admin()
        r = requests.get('{base_url}/api/facilityuser/'.format(base_url=self.base_url), headers=self.headers)
        if r.status_code != 200:
            return []

        return [{'username': u['username'], 'id':u['id'], 'facility':u['facility']}
                for u in json.loads(r.content) if u['roles'] == []]

    def get_content_resources(self, contents, kind):
        resources = [{'content_id': content['id'],
                      'channel_id': content['channel_id'],
                      'assessment_item_ids': None if kind != 'exercise' else
                      [content['assessment_item_ids'] for content in content['assessmentmetadata']],
                      'files':[file['download_url']
                               for file in content['files']]} for content in contents if content['kind'] == kind]

        return resources

    def get_resources(self):
        resources = {'video': [], 'html5': [], 'document': [], 'exercise': []}
        if not self.headers:
            self.login_admin()
        r = requests.get(add_timestamp('{base_url}/api/contentnode/?popular=true'.format(base_url=self.base_url)),
                         headers=self.headers)
        if r.status_code != 200:
            return resources
        try:
            contents = json.loads(r.content)
            for kind in resources.keys():
                resources[kind] = self.get_content_resources(contents, kind)
        except ValueError:
            #  bad response from the server
            pass
        finally:
            return resources


class KolibriUserBehavior(TaskSet):

    KOLIBRI_USERS = []
    RESOURCES = {'video': [], 'html5': [], 'document': [], 'exercise': []}

    def on_start(self):
        # retrieve headers for the current user
        self.headers = self.get_headers()
        self.current_user = None
        self.logs_ids = self.get_logs_ids_dict()

        if KolibriUserBehavior.KOLIBRI_USERS:
            self.current_user = random.choice(KolibriUserBehavior.KOLIBRI_USERS)
            print('Current user: {}'.format(self.current_user['username']))
            self.log_in(self.current_user['username'], facility=self.current_user['facility'])
        else:
            # TODO: add appropiate logging
            print('No learners to run the tests. At least 1 admin + 1 coach + 1 learner are needed')
            sys.exit(1)

    def log_in(self, username, password=None, headers=None, facility=None):
        data = {'username': username}

        if password:
            data['password'] = password
        if facility:
            data['facility'] = facility

        if not headers:
            headers = self.headers

        r = self.client.post('/api/session/', data=data, headers=headers)
        # update headers with the new set of entries
        self.set_headers({'X-CSRFToken': r.cookies['csrftoken'],
                          'Cookie': 'sessionid={session_id}; csrftoken={csrf_token}'.format(
                              session_id=r.cookies['sessionid'],
                              csrf_token=r.cookies['csrftoken'])})
        return r.status_code == 200

    def log_out(self, headers=None):
        if not headers:
            headers = self.headers
        r = self.client.delete('/api/session/current/', headers=headers)
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

    def load_resource(self, kind, with_timestamp=False):
        if KolibriUserBehavior.KOLIBRI_RESOURCES[kind]:
            resource = random.choice(KolibriUserBehavior.KOLIBRI_RESOURCES[kind])
            # less fetch all the resources:
            for file_url in resource['files']:
                if with_timestamp:
                    file_url = add_timestamp(file_url)
                self.client.get(file_url)
            self.do_logging(resource, kind)

    def get_logs_ids_dict(self):
        return {
            'contentsessionlog_id': None,
            'masterylog_id': None,
            'contentsummarylog_id': None,
            'attemptlog_id': None
        }

    def do_logging(self, resource, kind):
        content_id = resource['content_id']
        channel_id = resource['channel_id']

        self.do_contentsessionlog(content_id, channel_id, kind)
        self.do_contentsummarylog(content_id, channel_id, kind)
        self.do_userprogress()
        self.do_usersessionlog()

        # log masterylog only if it hasn't been logged yet
        if not self.logs_ids.get('masterylog_id'):
            self.do_masterylog(content_id, channel_id, kind)

        # log attemptlog only if content type is exercise
        if kind == 'exercise':
            self.do_attemptlog(resource)

    def do_contentsessionlog(self, content_id, channel_id, kind):
        log_url = '/api/contentsessionlog/'

        # create POST request to get the log id
        timestamp = dt.now().strftime('%Y-%m-%dT%H:%M:%S.%fZ')
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
        log_url_patch = '{log_url}{log_id}/'.format(log_url=log_url, log_id=data['pk'])
        r = self.client.patch(log_url_patch, data=data, headers=self.headers)

        # set log id for other log methods to use if necessary
        self.logs_ids['contentsessionlog_id'] = data['pk']

        return r.status_code == 200

    def do_contentsummarylog(self, content_id, channel_id, kind):
        log_url = '/api/contentsummarylog/'

        # set general data object (for PATCH and optionally POST requests)
        timestamp = dt.now().strftime('%Y-%m-%dT%H:%M:%S.%fZ')
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

        # create a GET request to check if the log already exists
        log_url_get = '{log_url}?content_id={content_id}&user_id={user_id}'.format(
            log_url=log_url, content_id=content_id, user_id=self.current_user['id'])
        r = self.client.get(add_timestamp(log_url_get))
        if not r.status_code == 200:
            return False

        contents = json.loads(r.content)
        if len(contents) > 0:
            # log exists, extract the log id from the GET response
            log_id = contents[0]['pk']
        else:
            # create summarylog if it doesn't exists yet
            r = self.client.post(add_timestamp(log_url, first=True), data=data, headers=self.headers)
            if not r.status_code == 201:
                return False
            log_id = json.loads(r.content)['pk']

        # create PATCH request to update the log
        data['pk'] = log_id
        log_url_patch = '{log_url}{log_id}/'.format(log_url=log_url, log_id=log_id)
        r = self.client.patch(log_url_patch, data=data, headers=self.headers)

        # set log id for other log methods to use if necessary
        self.logs_ids['contentsummarylog_id'] = log_id

        return r.status_code == 200

    def do_masterylog(self, content_id, channel_id, kind):
        log_url = '/api/masterylog/'

        timestamp = dt.now().strftime('%Y-%m-%dT%H:%M:%S.%fZ')
        data = {
            'user': self.current_user['id'],
            'summarylog': self.logs_ids.get('contentsummarylog_id'),
            'start_timestamp': timestamp,
            'completion_timestamp': None,
            'end_timestamp': None,
            'mastery_level': 1,
            'complete': False,
            'responsehistory': [],
            'pastattempts': [],
            'totalattempts': 0,
            'mastery_criterion': '{}'
        }
        r = self.client.post(add_timestamp(log_url, first=True), data=data, headers=self.headers)

        if not r.status_code == 201:
            return False

        log_id = json.loads(r.content)['id']
        # set log id for other log methods to use if necessary
        self.logs_ids['masterylog_id'] = log_id

        return True

    def do_attemptlog(self, resource):
        perseus = ''
        for file in resource['files']:
            if file.endswith('.perseus'):
                perseus = file
                break
        if not resource['assessment_item_ids'] or not perseus:
            return False
        perseus_data = perseus.split("/")
        for data in perseus_data:
            if data.endswith('.perseus'):
                perseus = data
                break
        assessment_id = random.choice(resource['assessment_item_ids'][0])
        assessment_link = '/zipcontent/{perseus}/{assessment_id}.json'.format(perseus=perseus,
                                                                              assessment_id=assessment_id)
        r = self.client.get(add_timestamp(assessment_link, first=True), headers=self.headers)
        if not r.status_code == 200:
            return False
        exercise_contents = json.loads(r.content)
        exercise_attempts = self.build_attempts(exercise_contents, resource, previous_attempt=None)
        # First attemptlog to receive id information
        attempt_url = add_timestamp('/api/attemptlog/', first=True)
        r = self.client.post(attempt_url, data=exercise_attempts, headers=self.headers)
        if not r.status_code == 201:
            return False

        exercise_attempts = self.build_attempts(exercise_contents, resource, previous_attempt=json.loads(r.content))
        attempt_id = exercise_attempts['id']
        attempt_url_patch = '/api/attemptlog/{}/'.format(attempt_id)
        # last attemptlog after the exercise is finished
        r = self.client.patch(attempt_url_patch, data=exercise_attempts, headers=self.headers)
        return r.status_code == 200

    def build_attempts(self, exercise_contents, resource, previous_attempt=None):
        start = dt.now().strftime('%Y-%m-%dT%H:%M:%S.%fZ')
        if previous_attempt:
            start = previous_attempt['start_timestamp']
        end = dt.now().strftime('%Y-%m-%dT%H:%M:%S.%fZ')
        completion = dt.now().strftime('%Y-%m-%dT%H:%M:%S.%fZ') if previous_attempt else None
        time_spent = random.randint(200, 10000)
        item_id = resource['content_id']
        attempt_id = None if not previous_attempt else previous_attempt['id']
        complete = True if previous_attempt else False
        questions_type = list(exercise_contents['question']['widgets'].keys())[0]
        questions = []
        masterylog = self.logs_ids['masterylog_id']
        sessionlog = self.logs_ids['contentsessionlog_id']
        selected_choices = []
        choice_states = []

        states_payload = {'selected': False, 'highlighted': False, 'rationaleShown': False,
                          'correctnessShown': False, 'readOnly': False}
        exercise_options = exercise_contents['question']['widgets'][questions_type]['options']
        type_of_choices = 'choices' if 'choices' in exercise_options else 'answers'
        choices = exercise_options.get(type_of_choices, [])
        for index, choice in enumerate(choices):
            if type_of_choices == 'choices':
                question = {'originalIndex': index,
                            'correct': choice.get('correct', None),
                            'content': choice.get('content', None),
                            'images': choice.get('images', None)}
                selected_choices.append(choice.get('correct', None))
                choice_states.append(states_payload)
            else:
                question = {'value': choice.get('value', 0), 'status': 'correct', 'message': '', 'strict': False,
                            'simplify': True, 'maxError': 0, 'answerForms': choice.get('answerForms', [])}
            questions.append(question)

        if type_of_choices == 'choices':
            part_answer = {'numCorrect': 1, 'hasNoneOfTheAbove': False,
                           'multipleSelect': False, 'deselectEnabled': False,
                           'choices': questions,
                           'selectedChoices': selected_choices,
                           'choiceStates': choice_states}
        else:
            part_answer = {'static': False, 'answers': questions, 'size': 'normal',
                           'coefficient': False, 'labelText': ''}
        answer = json.dumps({'question': {questions_type: part_answer}, 'hints': []})

        interaction_history = [{'type': 'hint', 'answer': answer, 'timestamp': end}]
        if previous_attempt:
            # generate a random number of intents
            for attempt in range(random.randint(1, 5)):
                new_attempt = [{'type': 'answer', 'answer': answer, 'timestamp': end}]
                interaction_history.append(new_attempt)

        payload = {'id': attempt_id, 'user': self.current_user['id'],
                   'masterylog': masterylog, 'sessionlog': sessionlog,
                   'start_timestamp': start, 'completion_timestamp': completion, 'end_timestamp': end,
                   'item': item_id, 'complete': complete,
                   'time_spent': time_spent, 'correct': 0,
                   'answer': answer,
                   'simple_answer': '',
                   'interaction_history': json.dumps(interaction_history)
                   }

        return payload

    def do_userprogress(self):
        log_url = '/api/userprogress/{user_id}/'.format(user_id=self.current_user['id'])
        r = self.client.get(add_timestamp(log_url, first=True), headers=self.headers)
        return r.status_code == 200

    def do_usersessionlog(self):
        """
        Initiate a GET request on the session API endpoint with a `active=true` param, which in turns
        triggers the update of the usersessionlog entry via Kolibri Django signals
        """
        log_url = '/api/session/current/?active=true'
        r = self.client.get(log_url, headers=self.headers)
        return r.status_code == 200
