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

## Testing using Virtualbox VM

### Requirements

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/)
* [Ansible](https://www.ansible.com/)

###  Install required Ansible packages

* `ansible-galaxy install lborguetti.system-locale`

### Start the virtual machine

* change the working directory to the one where your Velox code is (where `Vagrantfile` is located)
* `vagrant up`

### Provision the virtual machine with Ansible

* `ssh-add .vagrant/machines/velox/virtualbox/private_key` to add the VM's private key to your host machine
* `cd vm_config`
* `ansible-playbook -i inventory.ini main.yml -v` to provision the VM

Note that `-v` argument in the last command isoptional and helps to debug potential issues.
Add `-vvvv` to enable to enable connection debugging.

### Running tests inside a virtual machine

If all went well with the installation, you should be able to `ssh` to the VM and run Velox / Kolibri. You can check the [Possible issues](#possible-issues) section if you ran into problems with the VM setup.

Start by `ssh`-ing to the VM:

``` vagrant ssh```

Your current working directory, where the Velox is installed, has been automatically mounted inside the VM, so all the changes you make on your host machine will be synced to the VM.

Once successfully connected to the VM, you can run:

* `. ~/.venvs/velox/bin/activate` to activate the Velox virtualenv
* `cd /vagrant` to change working directory to the Velox mounted directory

You're now ready to run Velox, but you will have to explicitly specify the `--kolibri_dev` / `-kd` and `--kolibri_venv` / `-kv` arguments to avoid changing the host `settings.py` file:

```python src/velox.py -kd /home/vagrant/kolibri/ -kv /home/vagrant/.venvs/kolibri/```

All the other parameters will be taken from the host machine `settings.py`, and of course, you can always override them directly within the VM using the CLI arguments, e.g.:

```python src/velox.py -kd /home/vagrant/kolibri/ -kv /home/vagrant/.venvs/kolibri/ -c exercise```

NOTE: PostgreSQL database backend is currently not suppored, so you will only be able to use `sqlite` with the `database` setting for the time being.

### Possible issues

#### "unreachable: true", "Host key verification failed"
This usually happens if you destroy and re-create vagrant machines (`vagrant destroy` and `vagrant up`) so you have to remove the ssh keys from the old VM.

The following command removes all keys belonging to the VM ip address from your `known_hosts` file:

* `ssh-keygen -f ~/.ssh/known_hosts -R 192.168.109.100`

You should be able to [provision the virtual machine](#provision-the-virtual-machine-with-ansible) now.

#### "unreachable=1", "Failed to connect to the host via ssh", "Connection timed out"

This usually happens where you create multiple vagrant instances, the solution should be easy:
* run `ssh-add -l`

to list all identities and confirm that there are more than one identities for vagrant `velox` virtual machines.

If this is the case, you can:
* run `ssh-add -D` to __remove all identities__ from the agent (__Do this only if you know what you're doing!__)
* change the working directory to the one where your Velox code is (where `Vagrantfile` is located)
* `ssh-add .vagrant/machines/velox/virtualbox/private_key` (re-add `velox` private key)
* you probably want to run `ssh-add` as well to re-add your personal ssh identities
