# -*- coding: utf-8 -*-
"""
Script to measure individual Kolibri API requests

At the moment requires Kolibri server running independently of this utility:
    - by default: http://127.0.0.1:8080
    - can be overriden by passing `-b` or `--base-url` CLI argument

Additionally, Kolibri instance should have user with 'admin:admin' credentials

"""

import argparse
import requests


class SoloTester(object):
    USERNAME = 'admin'
    PASSWORD = 'admin'

    def __init__(self, opts):
        self.opts = opts

        self.user_id = None
        self.headers = None
        self._login()

    def _login(self):
        data = {'username': SoloTester.USERNAME, 'password': SoloTester.PASSWORD}

        r = requests.get('{base_url}/user/'.format(base_url=self.opts.base_url))
        csrf_token = r.cookies['csrftoken']
        session_id = r.cookies['sessionid']

        cookie_header = 'sessionid={session_id}; csrftoken={csrf_token}'.format(
            session_id=session_id, csrf_token=csrf_token)

        headers = {'X-CSRFToken': csrf_token, 'Cookie': cookie_header}

        r = requests.post('{base_url}/api/session/'.format(base_url=self.opts.base_url),
                          data=data, headers=headers)

        self.user_id = r.json()['user_id']
        self.headers =  {'X-CSRFToken': r.cookies['csrftoken'],
                         'Cookie': 'sessionid={session_id}; csrftoken={csrf_token}'.format(
                             session_id=r.cookies['sessionid'],
                             csrf_token=r.cookies['csrftoken'])}

    def measure(self):
        if self.opts.target:
            try:
                target_fn = getattr(self, '_{target}'.format(target=self.opts.target))
                method, endpoint, data = target_fn()
            except AttributeError:
                print('ERROR: `_{}` target function has to be implemented'.format(self.opts.target))
                return
        else:
            method = self.opts.method
            endpoint = self.opts.endpoint
            data = None

        url = self.opts.base_url + endpoint

        run_times = []
        print('')

        for i in range(self.opts.series):
            if data:
                r = requests.request(method, url, data=data, headers=self.headers)
            else:
                r = requests.request(method, url, headers=self.headers)

            run_time = r.elapsed.total_seconds()
            run_times.append(run_time)

            run_time_display = str(run_time).ljust(8, '0')
            status_code_display = '{status} {status_description}'.format(
                status=r.status_code,
                status_description=requests.status_codes._codes[r.status_code][0].replace('_', ' ').upper())

            print('Run {run: <5} time={time: <8}s   status={status_code}   size={content_size}B'.format(
                run=i + 1, time=run_time_display, status_code=status_code_display,
                content_size=r.headers['Content-Length']))

        print('')
        print('-' * 80)
        print('Method:    {method}'.format(method=method))
        print('Endpoint:  {url}'.format(url=url))
        print('Runs:      {series}'.format(series=self.opts.series))
        print('Average:   {time}s'.format(time=sum(run_times) / self.opts.series))
        print('')

    def _post_contentsessionlog(self):
        method = 'POST'
        endpoint = '/api/contentsessionlog/'
        data = {
            'channel_id': '1a9158aa082a460b9ea693ba329e0770',
            'content_id': '0d62c6ce0b1949f8b5d27e377983227a',
            'end_timestamp': '2018-06-06T19:01:19.764926Z',
            'extra_fields': '{}',
            'kind': 'exercise',
            'progress': 0,
            'start_timestamp': '2018-06-06T19:01:19.764926Z',
            'time_spent': 0,
            'user': self.user_id
        }
        return method, endpoint, data


def get_parse_args():
    parser = argparse.ArgumentParser(description='SoloTester utility')
    parser.add_argument('-b', '--base-url', default='http://127.0.0.1:8080', help='API endpoint')
    parser.add_argument('-e', '--endpoint', help='API endpoint')
    parser.add_argument('-m', '--method', default='GET', help='HTTP method (default = GET)')
    parser.add_argument('-s', '--series', type=int, default=100, help='Number of run series')
    parser.add_argument('-t', '--target', required=False, help='Custom function target')

    return parser.parse_args()


if __name__ == '__main__':
    opts = get_parse_args()

    solo_tester = SoloTester(opts)
    solo_tester.measure()
