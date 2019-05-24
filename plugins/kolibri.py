from transformer.plugins import plugin, Contract
import transformer.python
from transformer.task import Task2
from typing import List
from transformer.scenario import Scenario


@plugin(Contract.OnTask)
def clean_request(task: Task2) -> Task2:
    """
    Removes Chrome-specific, RFC-non-compliant headers starting with `:`.
    Removes the cookie header as it is handled by Locust's HttpSession.
    """
    response = transformer.python.Standalone("self.parse_response(response)")
    items_to_remove = ('Pragma', 'Cache-Control', 'Referer')
    task.request.headers = {k: v for k, v in task.request.headers.items() if k not in items_to_remove}

    if "/api/" in task.request.url.path:
        task.statements.append(response)

    return task


@plugin(Contract.OnPythonProgram)
def add_format(tree: List[Scenario]) -> List[Scenario]:
    # remove comments:
    tree[0].comments = [
        "This Python file has been created to work with the velox tool for Kolibri.",
        "Using it out of this environment makes no sense.",
    ]

    kolibri_import = transformer.python.Import(["KolibriUserBehavior"], source="user")
    tree.insert(2, kolibri_import)
    tree.insert(2, transformer.python.Import(["logging"]))
    # add formatting to the requests:
    har = None
    classes = [subtree for subtree in tree if isinstance(subtree, transformer.python.Class)]
    for subtree in classes:
        if subtree.name == 'har':
            har = subtree
            break
    if har:
        # Change Task parent class:
        classes = [stmt.target for stmt in har.statements]
        har.superclasses = ['KolibriUserBehavior']
        for task in classes:
            task.superclasses = ['KolibriUserBehavior']

    return tree
