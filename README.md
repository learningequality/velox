# Velox

Velox is a tool used to measure how [Kolibri](https://github.com/learningequality/kolibri) responds to stress testing.

## Goal

As Kolibri keeps evolving at a fast pace, a need arises to synchronously concentrate on the performance aspects of the tool i.e. its ability to serve as many clients as possible with respect to the underlying hardware specifications.

Thus, main goals of Velox are:
- ability to set up reproducible tests to simulate various Kolibri use-case scenarios
-  the performance of the scenarios

## Overview

Key points:
- able to automatically prepare Kolibri channels data necessary for the performance tests
- able to simulate clients using Kolibri content by sending API requests via [Locust](https://github.com/locustio/locust) load testing library
- supports SQLite (Kolibri default) and PostgreSQL database backends
- features fully configurable test scenarios written in Python

## Detailed documentation

- [Installation](docs/installation.md)
- [Configuration options](docs/configuration-options.md)
- Using Velox
    - [Internally](docs/using-velox-internally.md)
    - [Testing an external Kolibri server](docs/using-velox-externally.md)
- Advanced usage
    - [Virtual machines](docs/advanced-usage-vms.md)
    - [Kolibri profiling](docs/advanced-usage-profiling.md)
