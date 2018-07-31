# Installation
[Velox](../README.md) ⟶ [Detailed documentation](../README.md#detailed-documentation) ⟶ Installation

## Prerequisites

### Kolibri (recommended)
You will need a local installation of Kolibri to use all of the Velox features. Follow the [online developer documentation](http://kolibri-dev.readthedocs.io/en/develop/) to set up Kolibri in development environment.

If you need Velox to test Kolibri servers running on the same network (or through Internet), there is a set of limited features explained in [Testing an external Kolibri server](./using-velox-externally.md), for which you do not need a local installation of Kolibri.

### PostgreSQL (optional)
To be able to run tests with the PostgreSQL database backend, there are additional steps to take.

#### Install PostgreSQL server
Make sure that [PostgreSQL](https://www.postgresql.org/) server is installed on your system and listening on port `5432`.

#### Install Kolibri PostgreSQL dependencies
Install Kolibri PostgresSQL related package dependencies by running the following command within the **Kolibri installation directory** (repository), and using the **Kolibri virtualenv** (as this is a Kolibri, not Velox, package requirement):

```pip install -r requirements/postgres.txt```

## Install Velox
- Clone the Velox repository
- Set up the virtualenv
- Activate the virtualenv
- Run `pip install -r requirements.txt` to retrieve dependencies
- Run `cp src/settings.example.py src/settings.py` to set some default settings

------

## Table of Contents

- [Velox](../README.md)
  - **Installation**
  - [Configuration options](./configuration-options.md)
  - [Using Velox](./using-velox.md)
  - [Test results](./test-results.md)
  - Advanced usage
    - [Virtual machines](./advanced-usage-vms.md)
    - [Kolibri profiling](./advanced-usage-profiling.md)
