# Configuration options

[Detailed documentation](../README.md#detailed-documentation) ⟶ Configuration options

--

## CLI arguments

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

### Configuration precedence list
1) CLI arguments
2) `settings` module
3) internally set [default values](#default-values)

## Using the `settings` module
All CLI arguments can be configured within the `settings.py` module to allow configuring settings on a more permanent basis.

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

------

## Table of Contents

- [Installation](docs/installation.md)
- **Configuration options**
- Using Velox
    - [Internally](docs/using-velox-internally.md)
    - [Testing an external Kolibri server](docs/using-velox-externally.md)
- Advanced usage
    - [Virtual machines](docs/advanced-usage-vms.md)
    - [Kolibri profiling](docs/advanced-usage-profiling.md)
