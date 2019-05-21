import time
import urllib.parse
from json import JSONDecodeError
from locust import TaskSequence
from typing import Dict

loggers = ('contentsessionlog', 'contentsummarylog', 'masterylog', 'attemptlog', 'examlog')

def query_replace(url_struct: urllib.parse.ParseResult, replacements: Dict[str, str]) -> urllib.parse.ParseResult:
    """
    Replaces query parameters in an url
    """
    query_params = dict(urllib.parse.parse_qsl(url_struct.query))
    new_query = {k: v if (k not in replacements) else replacements[k] for k, v in query_params.items()}
    final_struct = url_struct._replace(query=urllib.parse.urlencode(new_query))
    return final_struct

def param_replace(url_struct: urllib.parse.ParseResult, keyword: str, value: str) -> urllib.parse.ParseResult:
    """
    Replace parts of an url path that are used as parameters in GET requests
    """
    final_struct = url_struct
    if keyword in url_struct.path:
        path = url_struct.path.split("/")
        position = path.index(keyword)
        # check if next part is actually a parameter:
        if path[position + 1] != '':
            path[position + 1] = value
            final_struct = url_struct._replace(path='/'.join(path))
    return final_struct


class ClientWrapper(object):
    """
    Client created to proxy and modify the requests before they are sent via locust
    """
    def __init__(self, task: TaskSequence):
        self.task = task
        self.client = task.locust.client
        self.server = KolibriUserBehavior.server
        self.port = KolibriUserBehavior.port
        self.server_url = '{server}:{port}'.format(server=self.server, port=self.port)

    def process_url(self, url: str) -> str:

        replacements = {'contentCacheKey': KolibriUserBehavior.content_cache_key,
                        'user_id': self.task.user_id}

        url_struct = query_replace(urllib.parse.urlparse(url), replacements)
        params_replacements = {k: self.task.logs[k] for k in loggers}
        params_replacements['userprogress'] = self.task.user_id
        for param_id in params_replacements:
            url_struct = param_replace(url_struct, param_id, params_replacements[param_id])

        url_struct = url_struct._replace(netloc=self.server_url)
        return url_struct.geturl()

    def process_headers(self, headers):
        items_to_replace = {'User-Agent': 'velox', 'Host': self.server_url}
        if 'csrftoken' in self.client.cookies:
            items_to_replace['X-CSRFToken'] = self.client.cookies['csrftoken']
        return {k: v if (k not in items_to_replace) else items_to_replace[k] for k, v in headers.items()}

    def process_json(self, payload):
        # use the provided credentials:
        payload_to_replace = {'username': KolibriUserBehavior.user, 'password': KolibriUserBehavior.password}
        # facility management:
        if "facility" in payload:
            if self.task.facility_id:
                payload_to_replace['facility'] = self.task.facility_id
            else:
                # remove facility, supposing there's only one facility so kolibri will find it:
                del payload["facility"]

        if "user" in payload:
            payload_to_replace['user'] = self.task.user_id
        for logger in loggers:
            logger_slim = logger.replace('content', '')
            if logger_slim in payload:
                payload_to_replace[logger_slim] = self.task.logs[logger]

        return {k: v if (k not in payload_to_replace) else payload_to_replace[k] for k, v in payload.items()}

    def process_request(self, **kwargs):
        kwargs["url"] = self.process_url(kwargs["url"])
        kwargs["name"] = kwargs["url"]
        kwargs["headers"] = self.process_headers(kwargs["headers"])
        if "json" in kwargs:
            kwargs["json"] = self.process_json(kwargs["json"])
        return kwargs

    def get(self, **kwargs):
        return self.client.get(**self.process_request(**kwargs))

    def post(self, **kwargs):
        return self.client.post(**self.process_request(**kwargs))

    def put(self, **kwargs):
        return self.client.put(**self.process_request(**kwargs))

    def patch(self, **kwargs):
        return self.client.patch(**self.process_request(**kwargs))

    def delete(self, **kwargs):
        return self.client.delete(**self.process_request(**kwargs))

class KolibriUserBehavior(TaskSequence):
    port = '8080'  # Port to be assigned when calling this module
    server = '127.0.0.1'  # Server address to be assigned when calling this module
    user = 'admin'
    password = 'admin'
    content_cache_key = None

    def __init__(self, parent):
        super(KolibriUserBehavior, self).__init__(parent)
        if KolibriUserBehavior.content_cache_key is None:
            KolibriUserBehavior.content_cache_key = int(time.time())
        self.user_id = None
        self.facility_id = None
        self.logs = {k: None for k in loggers}

    def parse_response(self, response):
        try:
            response_data = response.json()
            if isinstance(response_data, list) and response_data:
                response_data = response_data[0]
        except JSONDecodeError:
            response_data = None
        if response.status_code == 400 or response.status_code == 404 or response.status_code >= 500:
            print("&&&&&&&& ERROR: {}".format(response.url))

        elif response_data:
            if 'auth' in response.url:
                if self.user_id is None:
                    self.user_id = response_data.get('user_id', None)
                if self.facility_id is None:
                    self.facility_id = response_data.get('facility_id', None)
            else:
                for log in loggers:
                    if log in response.url:
                        if log == 'contentsummarylog':
                            if response_data.get("currentmasterylog", None):
                                self.logs["masterylog"] = response_data["currentmasterylog"]["id"]
                        if response_data.get('id', None):
                            self.logs[log] = response_data.get('id', None)
                        break

    @property
    def client(self):
        """
        Reference to the :py:attr:`client <locust.core.Locust.client>` attribute of the root
        Locust instance.
        """
        return ClientWrapper(self)
