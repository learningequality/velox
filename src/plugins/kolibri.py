from transformer.plugins import plugin, Contract
import transformer.python
from transformer.task import Task2
from typing import List
from transformer.python import Statement

@plugin(Contract.OnTask)
def clean_request(task: Task2) -> Task2:
    """
    Removes Chrome-specific, RFC-non-compliant headers starting with `:`.
    Removes the cookie header as it is handled by Locust's HttpSession.
    """
    response = transformer.python.Standalone("self.parse_response(response)")
    items_to_remove = ("Pragma", "Cache-Control", "Referer")
    # items_to_replace = {'User-Agent': 'velox', 'Host': '{server}', 'X-CSRFToken': '{CSRFToken}'}
    # payload_to_replace = {'username': '{username}', 'password':'{password}'}
    task.request.headers = {
        k: v for k, v in task.request.headers.items() if k not in items_to_remove
    }
    # task.request.headers = {
    #     k: v if (not k in items_to_replace) else items_to_replace[k] for k, v in task.request.headers.items()
    # }
    # if task.request.post_data:
    #     payload = json.loads(task.request.post_data['text'])
    #     modified_payload = {
    #         k: v if (not k in payload_to_replace) else payload_to_replace[k] for k, v in payload.items()
    #     }
    #     task.request.post_data['text'] = json.dumps(modified_payload)
    # Set hostname as variables
    # url = task.request.url._replace(netloc='{server}:{port}').geturl()
    # task.request.url = urlparse(url)

    # treatement of the request response:
    # if task.request.url.path == "/" or "/api/" in task.request.url.path:
    if "/api/" in task.request.url.path:
        task.statements.append(response)

    return task


@plugin(Contract.OnPythonProgram)
def add_format(tree: List[Statement]) -> List[Statement]:
    # remove comments:
    tree[0].comments = [
        "This Python file has been created to work with the velox tool for Kolibri.",
        "Using it out of this environment makes no sense.",
    ]

    # # insert vars:
    # tree.insert(2, transformer.python.Assignment(lhs="server",
    #                                              rhs=None,
    #                                              comments=["Server address to be assigned when calling this module"]))
    # tree.insert(2, transformer.python.Assignment(lhs="port",
    #                                              rhs=None,
    #                                              comments=["Port to be assigned when calling this module"]))
    # add velox imports:
    tree.insert(2, transformer.python.Import(["KolibriUserBehavior"], source="user"))
    tree.insert(2, transformer.python.Import(["logging"]))
    tree.insert(2, transformer.python.Import(["between"], source="locust"))
    # add formatting to the requests:
    har = None
    locust_for_har = None
    classes = [
        subtree for subtree in tree if isinstance(subtree, transformer.python.Class)
    ]
    for subtree in classes:
        if subtree.name == "har":
            har = subtree
        elif subtree.name == "LocustForhar":
            locust_for_har = subtree
    if har:
        # functions = [line.target for stmt in har.statements for line in stmt.target.statements]
        # Change Task parent class:
        classes = [stmt.target for stmt in har.statements]
        har.superclasses = ["KolibriUserBehavior"]
        for task in classes:
            task.superclasses = ["KolibriUserBehavior"]
        # # Change client method to be proxied through the KolibriUserBehavior class:
        # for func in functions:
        #     if isinstance(func, transformer.python.Function):
        #         statement = func.statements[0]
        #         if isinstance(statement, transformer.python.Assignment):
        #             if statement.rhs.name == 'this task\'s request field':
        #                 statement.rhs = transformer.python.FunctionCall(str(statement.rhs)
        #                                                                 .replace("self.client.", "self.", 1))
    if locust_for_har:
        # add needed statements for Velox to work
        statements = [
            transformer.python.Assignment(
                "wait_time",
                transformer.python.Literal(
                    "between({min_d}, {max_d})".format(
                        min_d=transformer.locust.LOCUST_MIN_WAIT_DELAY,
                        max_d=transformer.locust.LOCUST_MAX_WAIT_DELAY,
                    )
                ),
            ),
            transformer.python.Assignment(
                "test_time", transformer.python.Literal("30s")
            ),
            transformer.python.Assignment(
                "host", transformer.python.Literal("'http://127.0.0.1:8080'")
            ),
        ]
        locust_for_har.statements += statements
    return tree
