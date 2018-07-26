# Installation

[Velox](../README.md) ⟶ [Detailed documentation](../README.md#detailed-documentation) ⟶ Installation


## Install requirements

### Kolibri (fully recommended)
If a local Kolibri installation does not exist, many of the velox features can't be used. You can follow the [online developer documentation](http://kolibri-dev.readthedocs.io/en/develop/) to set up Kolibri development environment.

Velox can work testing Kolibri servers available in the same network (or through Internet), with a set of limited features as explained in [Testing an external Kolibri server](./using-velox-externally.md). If that's the use case, Kolibri does not need to be installed.

### PostgreSQL (optional)
To be able to run tests with the PostgreSQL database backend, there are additional couple of steps to take.
#### Install PostgreSQL server
Make sure that [PostgreSQL](https://www.postgresql.org/) server is installed on your system and listening on port `5432`.
#### Install Kolibri PostgreSQL dependencies
Install Kolibri PostgresSQL related package dependencies by running the following command within the **Kolibri installation directory** (repository) and using the **Kolibri virtualenv** (as this is a Kolibri, not Velox, package requirement):

```pip install -r requirements/postgres.txt```

## Install Velox
- Clone the Velox repository
- Set up the virtualenv
- Activate the virtualenv
- run `pip install -r requirements.txt` to retrieve dependencies
- run `cp src/settings.example.py src/settings.py` to have some default `settings`

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
