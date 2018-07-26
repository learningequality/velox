
# Test results

[Velox](../README.md) ⟶ [Detailed documentation](../README.md#detailed-documentation) ⟶ Test results


## Overview

As Velox uses 3rd party library [Locust](https://locust.io/) to do the actual load testing of a runnning Kolibri server instance, it is also conveniently using its test results output.

## Location and filenames

After a successful test run, Velox will produce the results of the test in the `output/locust` directory of your Velox installation by creating two separate `.csv` files:
- distribution results
- requests results

Results are Locust generated `.csv` files, named using the following template:

```{year}_{month}_{day}__{hours}_{minutes}_{seconds}__{microseconds}_{scenario}_{csv type}```

e.g.:

- ```2018_07_13__14_51_34__753905_foo_scenario_distribution.csv```
- ```2018_07_13__14_51_34__753905_foo_scenario_requests.csv```

## Distribution results

TBD

## Requests results

TBD

------

## Table of Contents

- [Velox](../README.md)
  - [Installation](./installation.md)
  - [Configuration options](./configuration-options.md)
  - [Using Velox](./using-velox.md)
  - [Test results](./test-results.md)
  - Advanced usage
    - [Virtual machines](./advanced-usage-vms.md)
    - [Kolibri profiling](./advanced-usage-profiling.md)
