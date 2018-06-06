# -*- coding: utf-8 -*-
"""
Script to measure individual API requests

ATM requires Kolibri server running on http://127.0.0.1:8080

TODO: make options configurable via the CLI arguments
"""

import requests


class SoloTester(object):
    USERNAME = 'admin'
    PASSWORD = 'admin'

    def __init__(self, base_url):
        self.base_url = base_url
        self.headers = self.login_and_get_headers()

    def login_and_get_headers(self):
        data = {'username': SoloTester.USERNAME, 'password': SoloTester.PASSWORD}

        r = requests.get('{base_url}/user/'.format(base_url=self.base_url))
        csrf_token = r.cookies['csrftoken']
        session_id = r.cookies['sessionid']

        cookie_header = 'sessionid={session_id}; csrftoken={csrf_token}'.format(
            session_id=session_id, csrf_token=csrf_token)

        headers = {'X-CSRFToken': csrf_token, 'Cookie': cookie_header}

        r = requests.post('{base_url}/api/session/'.format(base_url=self.base_url),
                          data=data, headers=headers)

        return {'X-CSRFToken': r.cookies['csrftoken'],
                'Cookie': 'sessionid={session_id}; csrftoken={csrf_token}'.format(
                    session_id=r.cookies['sessionid'],
                    csrf_token=r.cookies['csrftoken'])}

    def measure(self, endpoint=None, verb='GET', series=1, verbose=False):
        url = self.base_url + endpoint

        run_times = []
        print('')

        for i in range(series):
            r = requests.request(verb, url)
            run_time = r.elapsed.total_seconds()
            run_time_padded = str(run_time).ljust(8, '0')
            run_times.append(run_time)

            if verbose:
                print('Run {run: <5} time={time: <8}s  status={status_code}  size={content_size}B'.format(
                    run=i + 1, time=run_time_padded, status_code=r.status_code,
                    content_size=r.headers['Content-Length']))
            else:
                print('Run {run: <5} {time}s'.format(run=i + 1, time=run_time_padded))

        print('')
        print('-' * 17)
        print('Endpoint: {url}'.format(url=url))
        print('Runs: {series}'.format(series=series))
        print('Average:  {time}s'.format(time=sum(run_times) / series))
        print('')


if __name__ == '__main__':
    endpoint = '/api/session/current/?active=true'
    verb = 'GET'
    series = 500
    verbose = True

    solo_tester = SoloTester(base_url='http://127.0.0.1:8080')
    solo_tester.measure(endpoint=endpoint, verb=verb, series=series, verbose=verbose)
