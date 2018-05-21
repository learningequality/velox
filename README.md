


# Velox

## What is Velox?
Velox is an extension library for the [Kolibri](https://github.com/learningequality/kolibri) project with a purpose to complete Kolibri by allowing setting up reproducible tests to simulate various use-case scenarios and measure their performance.

## Installing Velox
The project is being actively developed, which means that you may run into potential issues and that you will most probably have to set up a few things before being able to successfully run Velox in your environment.

### Requirements
#### Kolibri
You can follow the [online developer documentation](http://kolibri-dev.readthedocs.io/en/develop/) to set up the development environment.

#### PostgreSQL
To be able to run tests in the PostgreSQL context, you will have to install [PostgreSQL](https://www.postgresql.org/) and PostgresSQL related dependencies by running the following command (using the Kolibri virtualenv):

`pip install -r requirements/postgres.txt`

### Get Velox code
- Clone the Velox repository
- Set up the virtualenv
- Activate the virtualenv
- run `pip install -r requirements.txt` to retrieve dependencies

## Using Velox

### Getting started
Velox library consist of two main scripts which can be used independently:
- `bootstrap.py` - used to prepare the channels data for the actual tests
- `velox.py` - used to run tests

`velox.py` implicitly calls `bootstrap.py` with all the necessary arguments, so there may be not be a need to call `bootstrap.py` independently, but nevertheless,  it is possible.

You can run `python src/velox.py -h` or `python src/bootstrap.py -h`  to see more info on the available command line options.

It should be possible to run `velox` script simply by:

```python src/velox.py```

as there are certain internal defaults defined. Check them in the *Using the `settings` module* section.

### Testing scenarios
To specify which testing scenario to run, `-t` or `--test` command line option can be used, e.g.:

```python src/velox.py -t multiple_clients_multiple_resources```

If no tests are specified as command line options, all tests within the `scenarios` directory will be ran.

All testing scenarios should be located within the `scenarios` directory.
Each test scenario should be a python file and at minimum contain a function with the following syntax:

```
def run(base_url='http://kolibridemo.learningequality.org', learners=3):
    pass
```

Once ran, `velox` will try to load this module and execute its `run` function to launch the tests.

### Configuration

Command line arguments have the highest precedence, but it is also possible to enable Velox `settings` module to be able to configure settings on a more permanent basis.

#### Configuration precedence list
1) command line arguments
2) `settings` module
3) internally set defaults

#### Using the `settings` module
To enable the `settings` module simply copy the `settings.example.py`, rename it to `settings.py` and configure as per your development environment settings.

#### Default values

```
{
    'kolibri_dev': '',
    'kolibri_venv': os.path.join(os.path.expanduser('~'), os.path.join('.venvs', 'kolibri')),
    'kolibri_exec': '',
    'database': 'sqlite',
    'channel': 'multiple',
    'learners': 30,
    'classrooms': 1,
    'test': 'all',
    'iterations': 3,
    'db_postgresql_name': '',
    'db_postgresql_user': '',
    'db_postgresql_password': '',
    'db_postgresql_host': '127.0.0.1'
}
```
