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
        self.headers = self.login_and_get_headers()

    def login_and_get_headers(self):
        data = {'username': SoloTester.USERNAME, 'password': SoloTester.PASSWORD}

        r = requests.get('{base_url}/user/'.format(base_url=self.opts.base_url))
        csrf_token = r.cookies['csrftoken']
        session_id = r.cookies['sessionid']

        cookie_header = 'sessionid={session_id}; csrftoken={csrf_token}'.format(
            session_id=session_id, csrf_token=csrf_token)

        headers = {'X-CSRFToken': csrf_token, 'Cookie': cookie_header}

        r = requests.post('{base_url}/api/session/'.format(base_url=self.opts.base_url),
                          data=data, headers=headers)

        return {'X-CSRFToken': r.cookies['csrftoken'],
                'Cookie': 'sessionid={session_id}; csrftoken={csrf_token}'.format(
                    session_id=r.cookies['sessionid'],
                    csrf_token=r.cookies['csrftoken'])}

    def measure(self):
        url = self.opts.base_url + self.opts.endpoint

        run_times = []
        print('')

        for i in range(self.opts.series):
            r = requests.request(self.opts.method, url)

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
        print('Endpoint: {url}'.format(url=url))
        print('Runs: {series}'.format(series=self.opts.series))
        print('Average:  {time}s'.format(time=sum(run_times) / self.opts.series))
        print('')


def get_parse_args():
    parser = argparse.ArgumentParser(description='SoloTester utility')
    parser.add_argument('-b', '--base-url', default='http://127.0.0.1:8080', help='API endpoint')
    parser.add_argument('-e', '--endpoint', required=True, help='API endpoint')
    parser.add_argument('-m', '--method', default='GET', help='HTTP method (default = GET)')
    parser.add_argument('-s', '--series', type=int, default=100, help='Number of run series')

    return parser.parse_args()


if __name__ == '__main__':
    opts = get_parse_args()

    solo_tester = SoloTester(opts)
    solo_tester.measure()
