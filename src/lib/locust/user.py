# -*- coding: utf-8 -*-
"""
User class for the locust scenario runner
"""
from __future__ import print_function, unicode_literals

import json
import random
import requests
import sys
import time

from datetime import datetime as dt
from locust import TaskSet

def get_pk( node):
    # Old versions of Kolibri use 'id' instead of 'pk'
    pk ='pk'
    if b'pk' not in node:
        pk = 'id'
    return pk


class AdminUser(object):

    USERNAME = 'admin'
    PASSWORD = 'admin'

    def __init__(self, base_url):
        self.base_url = base_url
        self.headers = None
        self.download_url = 'storage_url'


    def login_admin(self):
        data = {'username': AdminUser.USERNAME, 'password': AdminUser.PASSWORD}

        r = requests.get('{base_url}/user/'.format(base_url=self.base_url))
        session_identifier = 'kolibri' if 'kolibri' in r.cookies else 'sessionid'
        r = requests.get('{base_url}/api/auth/session/current/?active=false'.format(base_url=self.base_url))
        csrf_token = '' if 'csrftoken' in r.cookies else r.cookies['csrftoken']
        session_id = r.cookies['csrftoken']
        cookie_header = '{session_identifier}={session_id}; csrftoken={csrf_token}'.format(
            session_identifier=session_identifier, session_id=session_id, csrf_token=csrf_token)
        headers = {'X-CSRFToken': csrf_token, 'Cookie': cookie_header}

        r = requests.post('{base_url}/api/session/'.format(base_url=self.base_url), data=data, headers=headers)
        if r.status_code == 404: # Kolibri version > v0.11
            r = requests.post('{base_url}/api/auth/session/'.format(base_url=self.base_url), data=data, headers=headers)
        # update headers with the new set of entries
        self.headers = {'X-CSRFToken': r.cookies['csrftoken'],
                        'Cookie': '{session_identifier}={session_id}; csrftoken={csrf_token}'.format(
                            session_identifier=session_identifier, session_id=r.cookies[session_identifier],
                            csrf_token=r.cookies['csrftoken'])}

    def get_users(self):
        if not self.headers:
            self.login_admin()
        r = requests.get('{base_url}/api/facilityuser/'.format(base_url=self.base_url), headers=self.headers)
        if r.status_code != 200:  # Kolibri version > v0.11
            r = requests.get('{base_url}/api/auth/facilityuser/'.format(base_url=self.base_url), headers=self.headers)
            if r.status_code != 200:
                return []

        return [{'username': u['username'], 'id':u['id'], 'facility':u['facility']}
                for u in json.loads(r.content) if u['roles'] == []]

    def get_content_resources(self, contents, kind):
        resources = []
        if contents:
            pk = get_pk(contents[0])
            try:
                resources = [{'content_id': content[pk],
                            'files':[file[self.download_url] for file in content['files'] if 'files' in content.keys()],
                            'channel_id': content['channel_id'],
                            'assessment_item_ids': None if kind != 'exercise' else
                            [content['assessment_item_ids'] for content in content['assessmentmetadata']]}
                            for content in contents if content['kind'] == kind]
            except KeyError:
                #  old api format
                self.download_url = 'download_url'
        return resources

    def get_resources(self):
        resources = {'video': [], 'html5': [], 'document': [], 'exercise': []}
        if not self.headers:
            self.login_admin()
        # get available channels:
        r = requests.get('{base_url}/api/contentnode/all_content/'.format(base_url=self.base_url),
                         headers=self.headers)
        if r.status_code == 404:
            r = requests.get('{base_url}/api/content/contentnode_slim/'.format(base_url=self.base_url),
                            headers=self.headers)
        if r.status_code != 200:
            return resources
        else:
            try:
                contents = json.loads(r.content)
                for kind in resources.keys():
                    resources[kind] = resources[kind] + self.get_content_resources(contents, kind)
            except ValueError:
                #  bad response from the server
                pass
            finally:
                return resources


class KolibriUserBehavior(TaskSet):

    KOLIBRI_USERS = []
    RESOURCES = {'video': [], 'html5': [], 'document': [], 'exercise': []}
    TIMEOUT = (60, 60)
    RANDOMIZE = True

    def on_start(self):
        # retrieve headers for the current user
        self.headers = self.get_headers()
        self.current_user = None
        self.logs_ids = self.get_logs_ids_dict()
        self.kolibri_new_version = False
        self.url_auth_prefix = ""
        self.url_logger_prefix = ""
        self.url_content_prefix = "contentnode/"
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

        r = self.client.post('/api/session/', data=data, headers=headers,
                             timeout=KolibriUserBehavior.TIMEOUT)
        if r.status_code == 404: # Kolibri version > v0.11
                self.kolibri_new_version = True
                self.url_auth_prefix = "auth/"
                self.url_logger_prefix = "logger/"
                self.url_content_prefix = "content/contentnode_slim/"
                r = self.client.post('/api/{}session/'.format(self.url_auth_prefix), data=data, headers=headers,
                            timeout=KolibriUserBehavior.TIMEOUT)
        # update headers with the new set of entries
        session_identifier = 'kolibri' if 'kolibri' in r.cookies else 'sessionid'
        self.set_headers({'X-CSRFToken': r.cookies['csrftoken'],
                          'Cookie': '{session_identifier}={session_id}; csrftoken={csrf_token}'.format(
                              session_identifier=session_identifier, session_id=r.cookies[session_identifier],
                              csrf_token=r.cookies['csrftoken'])})
        return r.status_code == 200

    def log_out(self, headers=None):
        if not headers:
            headers = self.headers
        r = self.client.delete('/api/{}session/current/'.format(self.url_auth_prefix), headers=headers)
        return r.status_code == 200

    def get_headers(self):
        r = self.client.get('/user/')
        r = self.client.get('/api/auth/session/current/?active=false')
        self.csrf_token = r.cookies['csrftoken']
        session_identifier = 'kolibri' if 'kolibri' in r.cookies else 'sessionid'
        self.session_id = r.cookies['csrftoken']
        cookie_header = '{session_identifier}={session_id}; csrftoken={csrf_token}'.format(
            session_identifier=session_identifier, session_id=self.session_id, csrf_token=self.csrf_token)
        return {'X-CSRFToken': self.csrf_token, 'Cookie': cookie_header}

    def set_headers(self, headers):
        self.headers = headers

    def get_kolibri_users(self):
        r = self.client.get('/api/facilityuser/')
        # users with coach or admin role need password to login:
        return [{'username': u['username'], 'id':u['id'], 'facility':u['facility']}
                for u in json.loads(r.content) if u['roles'] == []]

    def browse_resource(self, parent_node=None):
        if not parent_node:
            self.get_facility()

            # select a channel
            channels = self.get_available_channels()
            if not channels:
                return
            channel = random.choice(channels) if KolibriUserBehavior.RANDOMIZE else channels[0]

            # get the channel data
            parent_node = self.get_content_node(channel['id'])
            if not parent_node:
                return

        # "click" on the node
        pk = get_pk(parent_node)
        self.get_content_node_ancestors(parent_node[pk])
        child_nodes = self.get_content_nodes_by_parent(parent_node[pk])
        if not child_nodes:
            return

        # "click" on a content node item
        child_node = random.choice(child_nodes) if KolibriUserBehavior.RANDOMIZE else child_nodes[0]
        kind = child_node['kind']

        # if the child node item is topic, do another round
        if kind == 'topic':
            self.browse_resource(parent_node=child_node)

        # fetch the full data for the "final" node and set `skip_node_endpoint` to True
        # when calling `do_resource` so that we don't fire that request for the 2nd time
        final_node = self.get_content_node(child_node[pk])
        if self.kolibri_new_version:
            resource = {'content_id': final_node[pk],
                        'channel_id': final_node['channel_id'],
                        'assessment_item_ids': None,
                        'files': [file['storage_url'] for file in final_node['files']]}
        else:
            resource = {'content_id': final_node[pk],
                        'channel_id': final_node['channel_id'],
                        'assessment_item_ids': None,
                        'files': [file['download_url'] for file in final_node['files']]}
        if kind == 'exercise' and 'assessmentmetadata' in final_node:
            assessment_item_ids = [assessment_item['assessment_item_ids']
                                   for assessment_item in final_node['assessmentmetadata']]
            resource['assessment_item_ids'] = assessment_item_ids

        self.do_resource(resource, kind, skip_node_endpoint=True)

    def load_resource(self, kind):
        resources_per_kind = KolibriUserBehavior.KOLIBRI_RESOURCES[kind]
        if resources_per_kind:
            if KolibriUserBehavior.RANDOMIZE:
                resource = random.choice(resources_per_kind)
            else:
                resource = resources_per_kind[0]
            self.do_resource(resource, kind)

    def do_resource(self, resource, kind, skip_node_endpoint=False):
        """
        This method simulates realistic usage scenario observed while interacting
        with Kolibri directly in the browser

        If `skip_node_endpoint` has been passed as True, call to `get_content_node`
        will be skipped, as we've already fired that request during content browsing
        simulation and want to test as much realistically as possible
        """
        content_id = resource['content_id']
        channel_id = resource['channel_id']

        self.get_next_content_node(content_id)
        self.do_contentsessionlog(content_id, channel_id, kind)
        self.do_contentsummarylog(content_id, channel_id, kind)
        self.get_content_node_ancestors(content_id)
        self.do_userprogress()
        self.do_usersessionlog()
        self.fetch_resource_files(resource, kind)

        # fetch contend node details only we haven't already done that while browsing content
        if not skip_node_endpoint:
            self.get_content_node(content_id)

        # log masterylog only if contentsummarylog has been logged and masterylog hasn't been yet
        if self.logs_ids.get('summarylog_id') and not self.logs_ids.get('masterylog_id'):
            self.do_masterylog(content_id, channel_id, kind)

        # log attemptlog only if content type is exercise
        if kind == 'exercise':
            self.do_attemptlog(resource)

    def fetch_resource_files(self, resource, kind):
        if kind == 'exercise':
            exercise_base = resource['files'][0]
            for assessment_item_id in resource['assessment_item_ids'][0]:
                self.client.get("{base}{assessment}.json".format(base=exercise_base, assessment=assessment_item_id),
                                timeout=KolibriUserBehavior.TIMEOUT)
        else:
            for file_url in resource['files']:
                if file_url:
                    self.client.get(file_url, timeout=KolibriUserBehavior.TIMEOUT)

    def get_logs_ids_dict(self):
        return {
            'contentsessionlog_id': None,
            'masterylog_id': None,
            'contentsummarylog_id': None,
            'attemptlog_id': None
        }

    def do_contentsessionlog(self, content_id, channel_id, kind):
        log_url = '/api/{}contentsessionlog/'.format(self.url_logger_prefix)
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
        contentsessionlog_url = '/api/{}contentsessionlog/'.format(self.url_logger_prefix)
        r = self.client.post(log_url, data=data, headers=self.headers,
                             timeout=KolibriUserBehavior.TIMEOUT, name=contentsessionlog_url)
        if not r.status_code == 201:
            return False

        # create PATCH request to update the log
        pk = get_pk(json.loads(r.content))
        data['pk'] = json.loads(r.content)[pk]
        log_url_patch = '{log_url}{log_id}/'.format(log_url=log_url, log_id=data['pk'])
        r = self.client.patch(log_url_patch, data=data, headers=self.headers, timeout=KolibriUserBehavior.TIMEOUT,
                              name='{}{}'.format(contentsessionlog_url, self.current_user['username']))

        # set log id for other log methods to use if necessary
        self.logs_ids['contentsessionlog_id'] = data['pk']

        return r.status_code == 200

    def do_contentsummarylog(self, content_id, channel_id, kind):
        log_url = '/api/{}contentsummarylog/'.format(self.url_logger_prefix)

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
        r = self.client.get(log_url_get, timeout=KolibriUserBehavior.TIMEOUT,
                            name='{}{}'.format(log_url, self.current_user['username']))
        if not r.status_code == 200:
            return False

        contents = json.loads(r.content)
        if len(contents) > 0:
            # log exists, extract the log id from the GET response
            pk = get_pk(contents[0])
            log_id = contents[0][pk]
        else:
            # create summarylog if it doesn't exists yet
            r = self.client.post(log_url, data=data, headers=self.headers, timeout=KolibriUserBehavior.TIMEOUT,
                                 name='{}{}'.format(log_url, self.current_user['username']))
            if not r.status_code == 201:
                return False
            pk = get_pk(r.content)
            log_id = json.loads(r.content)[pk]

        # create PATCH request to update the log
        data['pk'] = log_id
        log_url_patch = '{log_url}{log_id}/'.format(log_url=log_url, log_id=log_id)
        r = self.client.patch(log_url_patch, data=data, headers=self.headers, timeout=KolibriUserBehavior.TIMEOUT,
                              name='{}{}'.format(log_url, self.current_user['username']))

        # set log id for other log methods to use if necessary
        self.logs_ids['contentsummarylog_id'] = log_id

        return r.status_code == 200

    def do_masterylog(self, content_id, channel_id, kind):
        log_url = '/api/{}masterylog/'.format(self.url_logger_prefix)
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
        r = self.client.post(log_url, data=data, headers=self.headers, timeout=KolibriUserBehavior.TIMEOUT,
                             name='{}{}'.format(log_url, self.current_user['username']))

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
        if KolibriUserBehavior.RANDOMIZE:
            assessment_id = random.choice(resource['assessment_item_ids'][0])
        else:
            assessment_id = resource['assessment_item_ids'][0][0]
        assessment_link = '/zipcontent/{perseus}/{assessment_id}.json'.format(perseus=perseus,
                                                                              assessment_id=assessment_id)

        r = self.client.get(assessment_link, headers=self.headers, timeout=KolibriUserBehavior.TIMEOUT)
        if not r.status_code == 200:
            return False
        exercise_contents = json.loads(r.content)
        exercise_attempts = self.build_attempts(exercise_contents, resource, previous_attempt=None)
        # First attemptlog to receive id information
        attempt_url = '/api/attemptlog/'
        r = self.client.post(attempt_url, data=exercise_attempts, headers=self.headers,
                             timeout=KolibriUserBehavior.TIMEOUT)
        if not r.status_code == 201:
            return False

        exercise_attempts = self.build_attempts(exercise_contents, resource, previous_attempt=json.loads(r.content))
        attempt_id = exercise_attempts['id']
        attempt_url_patch = '/api/attemptlog/{}/'.format(attempt_id)
        # last attemptlog after the exercise is finished
        r = self.client.patch(attempt_url_patch, data=exercise_attempts, headers=self.headers,
                              timeout=KolibriUserBehavior.TIMEOUT,
                              name='/api/attemptlog/{}'.format(self.current_user['username']))
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
            no_intents = random.randint(1, 5) if KolibriUserBehavior.RANDOMIZE else 5
            for attempt in range(no_intents):
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
        log_url = '/api/{prefix}userprogress/{user_id}/'.format(prefix=self.url_logger_prefix, user_id=self.current_user['id'])
        r = self.client.get(log_url, headers=self.headers, timeout=KolibriUserBehavior.TIMEOUT,
                            name='/api/{}userprogress/{}'.format(self.url_logger_prefix, self.current_user['username']))
        return r.status_code == 200

    def do_usersessionlog(self):
        """
        Initiate a GET request on the session API endpoint with a `active=true` param, which in turns
        triggers the update of the usersessionlog entry via Kolibri Django signals
        """
        log_url = '/api/{}session/current/?active=true'.format(self.url_auth_prefix)
        r = self.client.get(log_url, headers=self.headers, timeout=KolibriUserBehavior.TIMEOUT)
        return r.status_code == 200

    def get_with_headers(self, url):
        r = self.client.get(url, headers=self.headers, timeout=KolibriUserBehavior.TIMEOUT)
        if r.status_code != 200:
            return None
        return json.loads(r.content)

    def get_facility(self):
        facility = self.get_with_headers('/api/{}facility/'.format(self.url_auth_prefix))

        return facility

    def get_available_channels(self):
        if self.kolibri_new_version:
            available_channels = self.get_with_headers('/api/content/channel/?available=true')
        else:
            available_channels = self.get_with_headers('/api/channel/?available=true')
        return available_channels


    def get_content_node(self, content_node_id):
        url = '/api/{prefix}?ids={content_node_id}&by_role=true'.format(prefix=self.url_content_prefix,content_node_id=content_node_id)
        try:
            node = self.get_with_headers(url)
            return node[0]
        except TypeError:
            return None

    def get_content_node_ancestors(self, content_node_id):
        url = '/api/{prefix}{content_node_id}/ancestors/'.format(prefix=self.url_content_prefix, content_node_id=content_node_id)
        return self.get_with_headers(url)

    def get_content_nodes_by_parent(self, content_node_id):
        url = '/api/{prefix}?parent={content_node_id}&by_role=true'.format(prefix=self.url_content_prefix, content_node_id=content_node_id)
        return self.get_with_headers(url)

    def get_next_content_node(self, content_node_id):
        if self.kolibri_new_version:
            url = '/api/content/contentnode/{content_node_id}/next_content/'.format(content_node_id=content_node_id)
        else:
            url = '/api/contentnode/{content_node_id}/next_content/'.format(content_node_id=content_node_id)
        return self.get_with_headers(url)
