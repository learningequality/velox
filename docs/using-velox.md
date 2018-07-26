
# Using Velox

[Velox](../README.md) ⟶ [Detailed documentation](../README.md#detailed-documentation) ⟶ Using Velox


## Overview
This document explains how to use the Velox tool to run the stress tests after you've successfully [installed](./installation.md) the requirements and [configured](./configuration-options.md) all the steps necessary for it to function properly.

You can run `python src/velox.py -h`  to see more info on the available command line options, and [here](./configuration-options.md#options-in-detail) you can read about all the options in greater detail.

Running velox will:

- Bootstrap one Kolibri server and fill the needed data (users, classrooms, channels), unless an external Kolibri url is provided.
- Launch one Python thread per user.
- Each thread will run one of the tasks described in a `scenario`file per second. These tasks will consist on one or several requests to the server that's under test.
- Leave the statistics of the results in a csv file inside the `output/locust` directory.
- Stops after `run_time` is reached.

The way to parametrize some of these options is described in the following sections.

## Ways to run Velox
It is possible to use Velox in various configurations:
- Velox runs the Kolibri server using a **Kolibri development environment** and tests it
- Velox runs the Kolibri server using the installed **Kolibri executable application** and tests it
- Velox tests an already running **Kolibri instance** available through the network (localhost, LAN or Internet)

## Testing scenarios

In order to Velox to be able to test Kolibri under different use cases, tests are going to run a python file  placed at the `scenarios` directory.

No matter which of the different ways of running Velox is selected, a scenario must be provided always either in the `settings.py`file or as a command line argument.

Current Velox code provides several scenarios, being `scenarios/multiple_clients_multiple_resources.py` and `scenarios/multiple_clients_single_resources.py` the most common use cases.

These scenarios are coded to be compatible with the `Locust` library we use to do the massive requests and fetch the statistics. They must have always the same structure with some boilerplate containing the needed  Python imports. They have also several constants. If the `settings.py`file contains the same constants, the scenario values will be ignored, if not the scenario parameters will be used.

Here we can see them:

```python
admin = AdminUser(base_url=os.environ.get('KOLIBRI_BASE_URL', 'http://127.0.0.1:8000'))
KolibriUserBehavior.KOLIBRI_USERS = admin.get_users()
KolibriUserBehavior.KOLIBRI_RESOURCES = admin.get_resources()
KolibriUserBehavior.RANDOMIZE = False
...
def run(learners=30):
    launch(WebsiteUser, learners, run_time=120)
    ...
```
All the admin part is going to be used to login into Kolibri as an admin user, if possible, and get the list of users Kolibri has and the available channels and content resources.

`KolibriUserBehavior.RANDOMIZE = False` (default value is True) will force Velox selecting always the same resources and same intervals in all the run tests, to improve repeatibility. If it's not set, the resources every automated user will browse is selected randomly.

The other parameters are self-explanatory:

`learners` is the number of learners to simulate

`run_time`is the time Velox will be launching requests against Kolibri



## Run using a Kolibri development environment

### Prerequisites
To be able to use Velox to test the Kolibri server using a Kolibri development environment, first you should set it up.  [Kolibri Developer Guide -> Setting up Kolibri for development](http://kolibri-dev.readthedocs.io/en/develop/start/getting_started.html#setting-up-kolibri-for-development) explains how to build it.

When using this method, Velox will attempt to run a Kolibri server instance loading it as a Python module. This is done by calling the `kolibri`  module within the Kolibri development installation. The path to the Kolibri installation is defined by the `-kd` (`--kolibri-dev`) argument, and path to the Kolibri virtualenv is defined by the `-kv` (`--kolibri-venv`) argument.

### Required parameters
All the required parameters can be provided as arguments when calling velox or by writing them in the `src/settings.py` file

In order to run Velox in this configuration, it is required to specify the following arguments:

- `-kd` or `--kolibri-dev` -- path to the Kolibri development installation
If Kolibri virtualenv [is not located](http://kolibri-dev.readthedocs.io/en/develop/start/getting_started.html#virtual-environment) at `~/.venvs/kolibri` we need to provide also :
- `-kv` or `--kolibri-venv` -- path to the Kolibri virtualenv

### Examples

#### Minimum arguments required to run Velox
Velox will need, in this configuration two parameters: the location of the virtualenv that Kolibri uses and the location of the Kolibri source code.

In order to run Velox in this configuration, we can do it either using the `settings.py` file or specifying the following arguments:

```python src/velox.py -kd /path/to/kolibri/dev/installation -kv /path/to/kolibri/virtualenv```



or, having this `settings.py`:
```python
config = {
    'kolibri_dev': '/path/to/kolibri/dev/installation',
    'kolibri_venv': '/path/to/kolibri/virtualenv',

 ...
```
then velox can start just running:
```python src/velox.py```



## Run using a Kolibri executable application

### Prerequisites
To use Velox to test the Kolibri server using a Kolibri executable, you should be able to run Kolibri server simply by calling the Kolibri executable, from any location on your computer.

This usually means that you should be able to run the following command to start the Kolibri server:

```kolibri start```

If the above command successfully ran the Kolibri server on your computer, Velox will also be able to run it in the same manner. (Note: don't forget to run `kolibri stop` after running the `start` command if you don't need this particular server instance running).

### Required arguments

`-ke`, ``--kolibri-exec`` argument is used to define the exact Kolibri executable which Velox should use to run an instance of the Kolibri server.

Technically, specifying the above mentioned argument is only required if your particular executable differs from the default one: `kolibri`, which should not happen in most cases, meaning that this argument can be omitted

### Examples

#### Minimum arguments required to run Velox

In case your Kolibri executable equals to the default `kolibri`, you can run Velox with no arguments at all:

```python src/velox.py```

as Velox will attempt to start an instance of the Kolibri server by running `kolibri start`.

#### Specifying custom Kolibri executable

In case your Kolibri executable differs from the default value of `kolibri`, you can pass the `-ke` (`--kolibri-exec`) argument:

```python src/velox.py -ke your_kolibri_exec```

or:

```python src/velox.py --kolibri-exec your_kolibri_exec```

## Run using an already running Kolibri instance
Velox architecture allows running a [Scenario](Testing scenarios) against an existing running Kolibri instance, without launching an automated one. Any Kolibri installation accesible via network can be tested adding the url info in the scenario file.

In this case, there are important limitations due to the fact that Velox is not controlling the kolibri instance and does not have some important information like the admin user credentials, usernames, etc.



------

## Table of Contents

- [Velox](../README.md)
 - [Installation](./installation.md)
 - [Configuration options](./configuration-options.md)
 - **Using Velox**
 - [Test results](./test-results.md)
 - Advanced usage
   - [Virtual machines](./advanced-usage-vms.md)
   - [Kolibri profiling](./advanced-usage-profiling.md)




