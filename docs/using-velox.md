# Using Velox

[Velox](../README.md) ⟶ [Detailed documentation](../README.md#detailed-documentation) ⟶ Using Velox


## Overview
This document explains how to use the Velox tool to run the stress tests after you've successfully [installed](./installation.md) the requirements and [configured](./configuration-options.md) all the steps necessary for it to function properly.

You can run `python src/velox.py -h`  to see more info on the available command line options, and [here](./configuration-options.md#options-in-detail) you can read about all the options in greater detail.

## Ways to run Velox
It is possible to use Velox in various configurations:
- Velox runs the Kolibri server using a **Kolibri development environment** and tests it
- Velox runs the Kolibri server using a **Kolibri executable (package)** and tests it
- Velox tests an already running **Kolibri instance**

## Run using a Kolibri development environment

### Prerequisites
To be able to use Velox to test the Kolibri server using a Kolibri development environment, first you should set up one. The documentation on how to do that can be found in the [Kolibri Developer Guide -> Setting up Kolibri for development](http://kolibri-dev.readthedocs.io/en/develop/start/getting_started.html#setting-up-kolibri-for-development).

When using this method, Velox will attempt to run a Kolibri server instance by calling the `kolibri` Python module within the Kolibri development installation targeting the Python interpreter from the Kolibri virtualenv defined by the `-kv` (`--kolibri-venv`) argument.

### Required arguments
In order to run Velox in this configuration, it is required to specify the following arguments:

- `-kd` or `--kolibri-dev` — path to the Kolibri development installation
- `-kv` or `--kolibri-venv` — path to the Kolibri virtualenv

### Examples

#### Minimum arguments required to run Velox

```python src/velox.py -kd /path/to/kolibri/dev/installation -kv /path/to/kolibri/virtualenv```

The above shown command expression is equivalent to the following one, which is using long argument switches:

```python src/velox.py --kolibri-dev /path/to/kolibri/dev/installation --kolibri-venv /path/to/kolibri/virtualenv```

#### Kolibri virtualenv is located at `~/.venvs/kolibri`

`-kv`  (`--kolibri-venv`) argument can be omitted if you have set up the Kolibri virtualenv at `~/.venvs/kolibri` (as mentioned in the [Kolibri Developer Guide -> Getting started -> Virtual environment section](http://kolibri-dev.readthedocs.io/en/develop/start/getting_started.html#virtual-environment)):

```python src/velox.py -kd /path/to/kolibri/dev/installation```

## Run using a Kolibri executable

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
TBD

------

## Table of Contents

- [Velox](../README.md)
  - [Installation](./installation.md)
  - [Configuration options](./configuration-options.md)
  - **Using Velox**
  - Advanced usage
    - [Virtual machines](./advanced-usage-vms.md)
    - [Kolibri profiling](./advanced-usage-profiling.md)
