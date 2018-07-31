# Velox
Velox is a tool used to measure how [Kolibri](https://github.com/learningequality/kolibri) responds to stress testing.

## Goal
Kolibri keeps evolving at a fast pace, and we need to be able to keep assessing its ability to serve as many clients as possible on a given hardware specifications.

The main goals of Velox tool are to allow us to:
- set up reproducible tests to simulate various Kolibri use-case scenarios
- measure the performance of Kolibri in those scenarios

## Overview
With Velox we are able to:
- automatically obtain Kolibri channels data necessary for the performance tests
- simulate clients using Kolibri content by sending API requests via [Locust](https://github.com/locustio/locust) load testing library
- execute fully configurable test scenarios written in Python

Velox can work with both SQLite (Kolibri default) and PostgreSQL database backends

## Detailed documentation
- [Installation](docs/installation.md)
- [Configuration options](docs/configuration-options.md)
- [Using Velox](docs/using-velox.md)
- [Test results](docs/test-results.md)
- Advanced usage
    - [Virtual machines](docs/advanced-usage-vms.md)
    - [Kolibri profiling](docs/advanced-usage-profiling.md)
