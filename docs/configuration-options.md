
# Configuration options

[Velox](../README.md) ⟶ [Detailed documentation](../README.md#detailed-documentation) ⟶ Configuration options


## Overview

Velox can be configured via the following available options:
- passing CLI arguments when invoking Velox
- configuring `settings` module

## Configuration precedence list
1) CLI arguments
2) `settings` module
3) internally set [default values](#default-values)

## CLI arguments

### List of all options

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

### Options in detail

#### `kolibri_dev`
Defines path to the Kolibri development installation.

##### Example
If you have a Kolibri development installation located at `/home/yourusername/kolibri` you would pass that value as the `kolibri_dev` argument.

##### Note
Unless your Kolibri virtualenv is located at the default location, to be able to use `kolibri_dev` argument, you are required to pass the path to the Kolibri virtualenv as well (`kolibri_venv`).

#### `kolibri_venv`
Defines path to the Kolibri virtualenv.

##### Example
If you have a Kolibri virtualenv located at `/home/yourusername/kolibri_venv` you would pass that value as the `kolibri_venv` argument.

##### Note
If your Kolibri virtualenv is located at the default location (see [Default values](#default-values) section), this argument is not required.

#### `kolibri_exec`
Defines command to execute Kolibri CLI.

##### Example
Usually this will simply be `kolibri`.

#### `database`
Defines database backend which Kolibri is to use.

##### Options
- `sqlite`
- `postgresql`

#### `channel`
Defines channels to be used for Kolibri content.

##### Options
- `large` — single channel with the total content size of approx. 1Gb
- `multiple` — 10 channels with the total content sizes of approx. 30 Mb each
- `video` — channel with multiple videos
- `exercise` — channel with multiple exercises

#### `learners`
Defines number of learners per classroom which will be simulated when tests are run.

#### `classrooms`
Defines number of classrooms to be used with the tests.

#### `test`
Defines the specific test scenario to be run (`all` can be used if all available test scenarios are to be run).

##### Example
If the following test scenarios files are available within the `scenarios` directory:
- `test_scenario_foo.py`
- `test_scenario_bar.py`

you would use values `test_scenario_foo` and `test_scenario_bar` to define a specific test scenario to run, or use `all` to run both `test_scenario_foo` and `test_scenario_bar`.

Note that you should omit the python file extension `.py` when specifying the test scenario.

#### `iterations`
Defines number of times each test will be run.

## Using the `settings` module
To avoid passing additional arguments each time you want to call, it is possible to configure those within the `settings.py` module to allow configuring the settings on a more permanent basis.

### Enable the `settings` module

To enable the `settings` module, you only need to copy the template file named `settings.example.py` (located within the `src` directory) to the same directory and name it `settings.py`.

E.g.:

```cp src/settings.example.py src/settings.py```

After that, you can edit the `settings.py` as per your needs and Velox will use it to look for the configuration settings the next time it's run.

###  Integer based settings
`settings.py` keys with values set to `0` do not set those values to the actual value of `0` but rather denote that this key is supposed to be an integer. If left like this, `0` will be ignored (as there is no integer based setting where `0` value would make sense), and a default value for that key will be used. You can see a list of all the default values in the [Default values](#default-values) section.

### PostgreSQL related settings
To be able to run test scenarios with the PostgreSQL database backend enabled, you have to set `db_postgresql_*` settings within the `settings.py` module:

| Name                     | Default value |
| ------------------------ | ------------- |
| `db_postgresql_name`     |  `''`         |
| `db_postgresql_user`     |  `''`         |
| `db_postgresql_password` |  `''`         |
| `db_postgresql_host`     | `127.0.0.1`   |

### Channel mappings
You shouldn't remove or add any new keys to the `channel_mappings` setting as it is currently dependant on the Velox code.

This is probably going to change in the future in order to make it more configurable and independant of the codebase, but at this point, if you want to test against a specific channel, you could, for example, simply replace the currently set channel ID on one of the channel mappings and use that channel option (by specifying `-c` or `--channel` when running Velox, or using a configured setting).

## Default values

Listed below are the internally set default values for the settings which act as a fallback for the non-required settings when they are not provided neither by CLI arguments nor the `settings.py`:

```
{
    'kolibri_dev': '',
    'kolibri_venv': '~/.venvs/kolibri',
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

------

## Table of Contents

- [Velox](../README.md)
  - [Installation](./installation.md)
  - **Configuration options**
  - [Using Velox](./using-velox.md)
  - [Test results](./test-results.md)
  - Advanced usage
    - [Virtual machines](./advanced-usage-vms.md)
    - [Kolibri profiling](./advanced-usage-profiling.md)
