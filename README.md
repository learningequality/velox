# Velox

## What is Velox?
Velox is an extension library for the [Kolibri](https://github.com/learningequality/kolibri) project with a purpose to complete Kolibri by allowing setting up reproducible tests to simulate various use-case scenarios and measure their performance.

## Installing Velox
The project is being actively developed, which means that you may run into potential issues and that you will most probably have to set up a few things before being able to successfully run Velox in your environment.

### Install requirements
#### Kolibri
You can follow the [online developer documentation](http://kolibri-dev.readthedocs.io/en/develop/) to set up Kolibri development environment.

#### PostgreSQL (optional)
To be able to run tests with the PostgreSQL database backend, there are additional couple of steps to take.
##### Install PostgreSQL server
Make sure that [PostgreSQL](https://www.postgresql.org/) server is installed on your system and listening on port `5432`.
##### Install Kolibri PostgreSQL dependencies
Install Kolibri PostgresSQL related package dependencies by running the following command within the Kolibri virtualenv:
```pip install -r requirements/postgres.txt```

### Install Velox
- Clone the Velox repository
- Set up the virtualenv
- Activate the virtualenv
- run `pip install -r requirements.txt` to retrieve dependencies
- run `cp src/settings.example.py src/settings.py` to enable the `settings` module

## Configuration

### CLI arguments

| Name           | Switch           | Abbreviated |
| -------------- | ---------------- | ----------- |
| kolibri_dev    | `--kolibri-dev`  | `-k`        |
| kolibri_venv   | `--kolibri-venv` | `-k`        |
| kolibri_exec   | `--kolibri-exec` | `-k`        |
| database       | `--database`     | `-d`        |
| channel        | `--channel`      | `-c`        |
| learners       | `--learners`     | `-l`        |
| classrooms     | `--classrooms`   | `-s`        |
| test           | `--test`         | `-t`        |
| iterations     | `--iterations`   | `-i`        |

#### Configuration precedence list
1) CLI arguments
2) `settings` module
3) internally set [default values](#default-values)

### Using the `settings` module
All CLI arguments can be configured within the `settings.py` module to allow configuring settings on a more permanent basis.

####  Integer based settings
`settings.py` keys with values set to `0` do not set those values to the actual value of `0` but rather denote that this key is supposed to be an integer. If left like this, `0` will be ignored (as there is no integer based setting where `0` value would make sense), and a default value for that key will be used. You can see a list of all the default values in the [Default values](#default-values) section.

#### PostgreSQL related settings
To be able to run test scenarios with the PostgreSQL database backend enabled, you have to set `db_postgresql_*` settings within the `settings.py` module:

| Name                     | Default value |
| ------------------------ | ------------- |
| `db_postgresql_name`     |  `''`         |
| `db_postgresql_user`     |  `''`         |
| `db_postgresql_password` |  `''`         |
| `db_postgresql_host`     | `127.0.0.1`   |

#### Channel mappings
You shouldn't remove or add any new keys to the `channel_mappings` setting as it is currently dependant on the Velox code.

This is probably going to change in the future in order to make it more configurable and independant of the codebase, but at this point, if you want to test against a specific channel, you could, for example, simply replace the currently set channel ID on one of the channel mappings and use that channel option (by specifying `-c` or `--channel` when running Velox, or using a configured setting).

### Default values

Listed below are the internally set default values for the settings which act as a fallback for the non-required settings when they are not provided neither by CLI arguments nor the `settings.py`:

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

## Using Velox

### Getting started
Velox library consist of two main scripts which can be used independently:
- `bootstrap.py` - used to prepare the channels data for the actual tests
- `velox.py` - used to run tests

`velox.py` implicitly calls `bootstrap.py` with all the necessary arguments so you may never be in a need to call `bootstrap.py` independently, but nevertheless, it is possible to do so.

You can run `python src/velox.py -h` or `python src/bootstrap.py -h`  to see more info on the available command line options.

### Running Velox
At this point, it is recommended to run Velox using the Kolibri development environment so you are required to specify the following arguments in order to be able to run Velox:

- `-kd` or `--kolibri-dev` — path to the Kolibri development installation
- `-kv` or `--kolibri-venv` — path to the Kolibri virtualenv

Example of the minimum arguments required to run Velox:

```python src/velox.py -kd /path/to/kolibri/dev/installation -kv /path/to/kolibri/virtualenv```

`-kv` or `--kolibri-venv` argument can be omitted if you have set up the Kolibri virtualenv at `~/.venvs/kolibri` (as is mentioned in the [Kolibri Developer Guide -> Getting started -> Virtual environment section](http://kolibri-dev.readthedocs.io/en/develop/start/getting_started.html#virtual-environment)).

Example (Kolibri virtualenv is located at `~/.venvs/kolibri`):

```python src/velox.py -kd /path/to/kolibri/dev/installation```

To avoid specifying `--kolibri-dev` and `--kolibri-venv` arguments on the CLI each time you want to run Velox, you can configure those entries in the `settings.py`.

If those arguments have been defined in the `settings.py` module, you should now be able to run Velox simply by running:

```python src/velox.py```

NOTE: the above will run Velox with certain [default values](#default-values) which can be further configured (see [Configuration](#configuration) section)

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
