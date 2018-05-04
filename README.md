


# Velox

## What is Velox?
Velox is an extension library for the [Kolibri](https://github.com/learningequality/kolibri) project with a purpose to complete Kolibri by allowing setting up reproducable tests to simulate various use-case scenarios and measure their performance.

## Installing Velox
The project is being actively developed, which means that you may run into potential issues and that you will most probably have to set up a few things before being able to successfully run Velox in your environment.

Due to the current lack of support for PostgreSQL within the Kolibri, it is currently possible to run Velox only using the Kolibri development environment if you wish to run tests using PostgreSQL database as well.

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

### Patch Kolibri for PostgreSQL support
Due to the before-mentioned lack of support for PostgreSQL within the Kolibri, to be able to run Velox with the PostgreSQL database enabled, you will have to patch `kolibri/kolibri/deployment/default/settings/base.py` with the following code:

```
_db_engine = os.environ.get('KOLIBRI_DB_ENGINE', 'sqlite3')
if _db_engine == 'sqlite3':
    _db_name = os.path.join(KOLIBRI_HOME, os.environ.get('KOLIBRI_DB_NAME', 'db.sqlite3'))
elif _db_engine == 'postgresql':
    _db_name = os.environ.get('KOLIBRI_DB_NAME', 'kolibri')
_db_password = os.environ.get('KOLIBRI_DB_PASSWORD', '')
_db_user = os.environ.get('KOLIBRI_DB_USER', 'postgres')
_db_host = os.environ.get('KOLIBRI_DB_HOST', '')
_db_port = os.environ.get('KOLIBRI_DB_PORT', '')

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.{engine}'.format(engine=_db_engine),
        'NAME': _db_name,
        'PASSWORD': _db_password,
        'USER': _db_user,
        'HOST': _db_host,
        'PORT': _db_port,
        'OPTIONS': {}
    },
}

if _db_engine == 'sqlite3':
    DATABASES['default']['OPTIONS']['timeout'] = 100
```
## Using Velox

### Getting started
Velox library consist of two main scripts which can be used independently:
- `bootstrap.py` - used to prepare the channels data for the actual tests
- `velox.py` - used to run tests

`velox.py` implicitly calls `bootstrap.py` with all the necessary arguments, so there may be not be a need to call `bootstrap.py` independently, but nevertheless,  it is possible.

You can run `python src/velox.py -h` or `python src/bootstrap.py -h`  to see more info on the available command line options.

It should be possible to run `velox` script simply by:

`python src/velox.py`

as there are certain internal defaults defined.

### Configuration

Command line arguments have the highest precedence, but it is also possible to enable Velox `settings` module to be able to configure settings on a more permanent basis.

#### Configuration precedence list
1) command line arguments
2) `settings` module
3) internally set defaults
4) environment variables (currently only for PostgreSQL credentials)

#### Using the `settings` module
To enable the `settings` module simply copy the `settings.example.py`, rename it to `settings.py` and configure as you see fit.

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
    'db_postgresql_name': os.environ.get('KOLIBRI_DB_NAME', ''),
    'db_postgresql_user': os.environ.get('KOLIBRI_DB_USER', ''),
    'db_postgresql_password': os.environ.get('KOLIBRI_DB_PASSWORD', ''),
    'db_postgresql_host': os.environ.get('KOLIBRI_DB_HOST', '')
}
```

PostgreSQL credentials are currently being handle in a special way due to the compatibility issues with the current Kolibri codebase.
