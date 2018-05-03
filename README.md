
# Velox

## What is Velox?
Velox is a [Kolibri](https://github.com/learningequality/kolibri)  project's companion and its purpose is to complete Kolibri with setting up reproducable tests to simulate various use-case scenarios and measuring their performance.

## Running Velox
The project is being actively developed, which means that you may run into potential issues and that you will most probably have to set up a few things before being able to successfully run Velox in your environment.

Due to the current lack of support for PostgreSQL within the Kolibri, it is currently possible to run Velox using only Kolibri development environment.

### Requirements
#### Kolibri
You can follow the [online developer documentation](http://kolibri-dev.readthedocs.io/en/develop/) to set up the development environment.
#### PostgreSQL
To be able to run tests in the PostgreSQL context, you will have to install [PostgreSQL](https://www.postgresql.org/) and PostgresSQL related dependencies by running the following command (using the Kolibri virtualenv):
`pip install -r requirements/postgres.txt`

### Seting up Velox
- Clone the Velox repository
- Set up virtualenv
- run `pip install -r requirements.txt` to retrieve dependencies


### Patching Kolibri for PostgreSQL support
Due to the before-mentioned lack of support for PostgreSQL within the Kolibri, to be able to run Velox, you will have to patch `kolibri/kolibri/deployment/default/settings/base.py` with the following code:

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
### Using Velox
TBD
