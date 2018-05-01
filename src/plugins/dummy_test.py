# -*- coding: utf-8 -*-
"""
This is an example of test to be run after kolibri is running with the requested setup
The only condition for it to work is that a function called 'run' must exists.
Velox will load this module and will execute the run function.

Most of these tests (if not all) will use https://locust.io/ to execute different
kolibri parts
"""
from __future__ import print_function, unicode_literals
import random
import time


def run():
    random.seed()
    for _ in range(random.randrange(5)):
        print("testing")
        time.sleep(random.randrange(4))


if __name__ == '__main__':
    run()