# Using Velox
[Velox](../README.md) ⟶ [Detailed documentation](../README.md#detailed-documentation) ⟶ Using Velox

## Overview
This document explains how to use the Velox tool to run the stress tests after you've successfully [installed](./installation.md) the requirements, and [configured](./configuration-options.md) all the steps necessary for it to function properly.

You can run `python src/velox.py -h` to see more info on the available command line options, and [read about all the options](./configuration-options.md#options-in-detail) in greater detail.

After Velox has been run, it will:

- Start a Kolibri server and generate the necessary content data (users, classrooms, channels), unless an external Kolibri URL is provided.
- Launch a single Python thread per user.
- Make sure that each thread runs one of the tasks described in the `scenario` file per second. Note that these tasks may result in one or several HTTP requests sent to the Kolibri server being tested.
- Save the test statistics into a `.csv` file within the `output/locust` directory.
- Stop after the `run_time` seconds have passed.

## Testing scenarios
Velox looks for test scenarios files within the `scenarios` directory.

Independent of the way you run Velox ([see below](#ways-to-run-velox)), you must always provide a scenario, either in the `settings.py` file, or as a command line argument.

At this time Velox provides several predefined scenarios, of which the following are used most commonly:
- `scenarios/multiple_clients_multiple_resources.py`
- `scenarios/multiple_clients_single_resources.py`

The scenarios must be written to be compatible with the [Locust](https://locust.io/) library. This library is used to generate a large number of HTTP request and produce statistics of the process. Thus, scenarios  must contain a certain boilerplate structure with the Python imports necessary for proper function.

Due to some Locust-related restrictions, the scenarios should also contain the following code snippet to set several `KolibriUserBehavior` properties:

```python
admin = AdminUser(base_url=os.environ.get('KOLIBRI_BASE_URL', 'http://127.0.0.1:8000'))
KolibriUserBehavior.KOLIBRI_USERS = admin.get_users()
KolibriUserBehavior.KOLIBRI_RESOURCES = admin.get_resources()
KolibriUserBehavior.RANDOMIZE = False
```

`AdminUser` is a helper class used to login to Kolibri as an admin user and try to fetch the list of users, available channels and content resources.

Setting `KolibriUserBehavior.RANDOMIZE` to `False` (default value is `True`) will force Velox to always select the same resources and same intervals, in order to increase comparability across multiple test runs. If not set, the resources used to simulate browsing and using the content will be selected randomly.

`run` function is mandatory as it is responsible for launching the actual test, e.g.:

```python
def run(learners=30):
    launch(WebsiteUser, learners, run_time=120)
```

`launch` function accepts two configurable parameters:
- `learners` — number of learner users to simulate (defaults to `30`)
- `run_time` — number of seconds during which Velox will be sending HTTP requests to Kolibri (defaults to `600`)

## Ways to run Velox

### Run Velox with Kolibri development environment

#### Prerequisites
Set up the Kolibri development environment as explained in [Kolibri Developer Guide](http://kolibri-dev.readthedocs.io/en/develop/start/getting_started.html#setting-up-kolibri-for-development).

When you use this method, Velox will attempt to run a Kolibri server instance, and load it as a Python module by calling the `kolibri` module within the Kolibri development installation. The path to the Kolibri installation is defined by the `-kd` (`--kolibri-dev`) argument, and path to the Kolibri virtualenv is defined by the `-kv` (`--kolibri-venv`) argument.

#### Required parameters
All the required parameters can be provided as arguments when calling Velox, or by adding them to the `settings.py` file.

In order to run Velox with this configuration,  you must specify the following argument:

`-kd` or `--kolibri-dev` — path to the Kolibri development installation

If Kolibri virtualenv [is not located](http://kolibri-dev.readthedocs.io/en/develop/start/getting_started.html#virtual-environment) at `~/.venvs/kolibri`, you must also provide:

`-kv` or `--kolibri-venv` — path to the Kolibri virtualenv

#### Examples

##### Minimum arguments required to run Velox
In this configuration, two parameters are necessary:
- path to the Kolibri virtualenv
- path to the Kolibri source code

This can be accomplished either by using command line arguments:

```python src/velox.py -kd /path/to/kolibri/dev/installation -kv /path/to/kolibri/virtualenv```

or, by adding the following configuration options to the `settings.py`:
```python
config = {
    'kolibri_dev': '/path/to/kolibri/dev/installation',
    'kolibri_venv': '/path/to/kolibri/virtualenv',
     ...
}
```
This second option is probably more convenient, as this way you can run Velox simply by calling:
```python src/velox.py```


### Run Velox with Kolibri executable application

#### Prerequisites
To use Velox to test Kolibri server with Kolibri executable, you must be able to run the server simply by calling the Kolibri executable from any location on your computer.

This usually means that you need to be able to run the following command to start the Kolibri server:

```kolibri start```

If the above command successfully ran the Kolibri server on your computer, Velox will also be able to run it in the same manner. **Don't forget to run `kolibri stop` after running the `start` command if you don't need this particular server instance running**.

#### Required arguments

`-ke`, ``--kolibri-exec`` argument is used to define the exact Kolibri executable which Velox should use to run an instance of the Kolibri server.

Specifying the above argument is only required if your particular executable differs from the default one `kolibri`, and can be omitted in most cases.

#### Examples
##### Run Velox with minimum arguments

In case your Kolibri executable equals to the default `kolibri`, you can run Velox with no arguments at all:

```python src/velox.py```

Velox will attempt to start an instance of the Kolibri server by running `kolibri start`.

##### Specify the custom Kolibri executable
In case your Kolibri executable differs from the default value of `kolibri`, you can pass the `-ke` (`--kolibri-exec`) argument:

```python src/velox.py -ke your_kolibri_exec```

or:

```python src/velox.py --kolibri-exec your_kolibri_exec```

### Run Velox with Kolibri instance which is already running
Velox architecture allows running a [scenario](#testing-scenarios) against a Kolibri instance which is already active, and not launching one automatically. Any Kolibri installation accessible via network can be tested by configuring the URL value in the scenario file.

In this case, please be warned that there are important limitations due to the fact that Velox is unable to fully control the Kolibri instance, and does not have access to some important information (e.g. the admin user credentials, list of users, etc.)

To be able to run tests with this configuration, you need to retrieve a list of users and resources to be tested.

1. Check the scenario file that is going to be used, and remove the section responsible for retrieving the users and resources (using the `AdminUser` helper class):

```python
# admin = AdminUser(base_url=os.environ.get('KOLIBRI_BASE_URL', 'http://127.0.0.1:8000'))
# KolibriUserBehavior.KOLIBRI_USERS = admin.get_users()
# KolibriUserBehavior.KOLIBRI_RESOURCES = admin.get_resources()
KolibriUserBehavior.KOLIBRI_USERS = ['John', 'Amina']
KolibriUserBehavior.KOLIBRI_RESOURCES = ['/api/contentnode/012c1c73c01b4af9b3265d952a09ceb5/ancestors/',
                                         '/downloadcontent/d97c27b51ee7a26c60ddfd193ca36861.perseus/Mental_Math_to_Evaluate_Products_Practice_Exercise.perseus',
                                         '/downloadcontent/211523265f53825b82f70ba19218a02e.mp4/Counting_with_small_numbers_Low_Resolution.mp4']
```
2. Launch the tests from the same Velox source directory, invoking the scenario file directly and providing the external Kolibri server URL in the console:

```bash
velox$ KOLIBRI_BASE_URL=http://kolibridemo.learningequality.org/ python scenarios/multiple_clients_multiple_resources.py
```

**IMPORTANT**: Running Velox with this configuration has significant limitations, as users have to be able to login without password, and the network latency can have a significant impact on the results if the tests are being done via Internet.

However, being able to run Velox against an external instance is useful to test a Kolibri server in the same LAN (Local Area Network). In that case, if you create a user with `admin` / `admin` credentials for `username` and `password` fields for testing purposes, you will be able execute Velox, and the Step `1` mentioned above will not be necessary. All you need to run Velox is to set the following environment variable:
```bash
KOLIBRI_BASE_URL=http://192.168.1.33:8080 python scenarios/multiple_clients_multiple_resources.py
```

In the above example, `http://192.168.1.33:8080` is the URL of the Kolibri server which is to be tested.

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
