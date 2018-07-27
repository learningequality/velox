# Using Velox

[Velox](../README.md) ⟶ [Detailed documentation](../README.md#detailed-documentation) ⟶ Using Velox


## Overview
This document explains how to use the Velox tool to run the stress tests after you've successfully [installed](./installation.md) the requirements and [configured](./configuration-options.md) all the steps necessary for it to function properly.

You can run `python src/velox.py -h`  to see more info on the available command line options, and [here](./configuration-options.md#options-in-detail) you can read about all the options in greater detail.

After Velox has been run, it will:

- Start a Kolibri server and generate the necessary content data (users, classrooms, channels), unless an external Kolibri url is provided
- Launch a single Python thread per user
- Load test scenario file which was specified
- Make sure that each thread runs one of the tasks described in a `scenario` file per second (Note: these tasks may result in one or several HTTP requests sent to the Kolibri server being tested)
- Save the test statistics into in a csv file within the `output/locust` directory
- Stop after `run_time` seconds have passed

## Ways to run Velox
It is possible to use Velox in various configurations:
- Velox runs the Kolibri server using a **Kolibri development environment** and tests it
- Velox runs the Kolibri server using the installed **Kolibri executable application** and tests it
- Velox tests an already running **Kolibri instance** available through the network (localhost, LAN or Internet)

## Testing scenarios

Velox looks for test scenarios within the `scenarios` directory.

No matter which of the different ways of running Velox is selected, a scenario must always be provided, either in the `settings.py` file or as a command line argument.

At this time, Velox provides several predefined scenarios, of which the following are used most commonly:
- `scenarios/multiple_clients_multiple_resources.py`
- `scenarios/multiple_clients_single_resources.py`

The above mentioned scenarios are written to be compatible with the [Locust](https://locust.io/) library used to generate a large number of HTTP request and produce statistics of that process. Thus, scenarios are required to contain a certain boilerplate structure with the Python imports necessary for proper function.

Due to some Locust-related restrictions, the scenarios should also contain the following code snippet to set several `KolibriUserBehavior` properties:

```python
admin = AdminUser(base_url=os.environ.get('KOLIBRI_BASE_URL', 'http://127.0.0.1:8000'))
KolibriUserBehavior.KOLIBRI_USERS = admin.get_users()
KolibriUserBehavior.KOLIBRI_RESOURCES = admin.get_resources()
KolibriUserBehavior.RANDOMIZE = False
```

`AdminUser` is a helper class used to login to Kolibri as an admin user and try to fetch the list of users, available channels and content resources.

Setting `KolibriUserBehavior.RANDOMIZE` to `False` (default value is `True`) will force Velox to  always select the same resources and same intervals, in order to increase comparability across multiple test runs. If not set, the resources used to simulate browsing and using the content will be selected randomly.

`run` function is mandatory as it is responsible for launching the actual test, e.g.:

```python
def run(learners=30):
    launch(WebsiteUser, learners, run_time=120)
```

`launch` function accepts two configurable parameters:
- `learners` — number of learner users to simulate (defaults to `30`)
- `run_time` — number of seconds during which Velox will be sending HTTP requests to Kolibri (defaults to `600`)

## Run using a Kolibri development environment

### Prerequisites
To be able to use Velox to test the Kolibri server using a Kolibri development environment, first you should set it up.  [Kolibri Developer Guide -> Setting up Kolibri for development](http://kolibri-dev.readthedocs.io/en/develop/start/getting_started.html#setting-up-kolibri-for-development) explains how to build it.

When using this method, Velox will attempt to run a Kolibri server instance loading it as a Python module. This is done by calling the `kolibri`  module within the Kolibri development installation. The path to the Kolibri installation is defined by the `-kd` (`--kolibri-dev`) argument, and path to the Kolibri virtualenv is defined by the `-kv` (`--kolibri-venv`) argument.

### Required parameters
All the required parameters can be provided as arguments when calling Velox or by adding them to  the `settings.py` file.

In order to run Velox in this configuration, it is required to specify the following arguments:

- `-kd` or `--kolibri-dev` -- path to the Kolibri development installation
If Kolibri virtualenv [is not located](http://kolibri-dev.readthedocs.io/en/develop/start/getting_started.html#virtual-environment) at `~/.venvs/kolibri` we need to provide also :
- `-kv` or `--kolibri-venv` -- path to the Kolibri virtualenv

### Examples

#### Minimum arguments required to run Velox
In this configuration, two parameters are necessary:
- path to the Kolibri virtualen
- path to the Kolibri source code

This can be accomplished either by using command line arguments:

```python src/velox.py -kd /path/to/kolibri/dev/installation -kv /path/to/kolibri/virtualenv```

or, adding the following configuration options to the `settings.py`:
```python
config = {
    'kolibri_dev': '/path/to/kolibri/dev/installation',
    'kolibri_venv': '/path/to/kolibri/virtualenv',
     ...
```
which is probably more convinient as then yoiu can run Velox simply by calling:
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
Velox architecture allows running a [Scenario](Testing scenarios) against an existing running Kolibri instance, without launching one automatically. Any Kolibri installation accessible via network can be tested by configuring the url value in the scenario file.

In this case, please be warned that there are important limitations due to the fact that Velox is unable to control the Kolibri instance and does not have access to some important information (e.g. the admin user credentials, list of users, etc.).

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




