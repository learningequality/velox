# Velox
Velox is a tool used to measure how [Kolibri](https://github.com/learningequality/kolibri) responds to stress testing.

## Goal
Kolibri keeps evolving at a fast pace, and we need to be able to keep assessing its ability to serve as many clients as possible on given hardware specifications.

The main goals of Velox tool are to allow us to:
1. compare the performance of different versions of Kolibri in a set of predetermined scenarios
2. compare the performance of a Kolibri version between different hardware setups
3. reproduce case uses in a controlled environment to provide better debugging information and do test loads of these cases

## Overview
With Velox we are able to:
- Use the [Locust](https://github.com/locustio/locust) load testing library against a server

- Obtain stats on failed requests against a server with predetermined channels and users information

- In case the server channels are not the ones in the included tests, create easily new tests according to defined scenarios, no matter the server content

- After a dump of the browser with an user journey, create Locust tests and use them against  server to reproduce any number of users



  Velox is agnostic of the backend in the server. It only needs to have the url of the server and the users and channels data provided in the tests to work correctly.

## Using Velox
### Test using a testing channel in the server

Velox provides a collection of scenarios to be tested. These scenarios depend on the existence of a testing channel imported in the server to be tested. The channels that need to be previously imported are:

- **Velox testing channel** with token `gosin-tikos`
- **Performance Test - Small Channel 1** with token `nilih-bubiz`

The testing scenarios are defined using *Gherkin* stories, and upon of them, the needed Python files to run the tests have been generated. All these files are in the `scenarios` directory provided with Velox.



### Test on a server with any channel content

In case it's not possible to import in the server the channels mentioned above, or if just testing a different channel is defined, the reproducibility of the tests can be mostly kept if the *Gherkin* stories are used to produce new Python testing files where the desired channels are involved.

In order to create these needed Python files, Velox provides a tool that will create them after these steps are followed:

1. Record a *har* file with the scenario execution:
   1. Create a folder called har in your machine.
   2. Prepare your scenario by reading the first *Gherkin* story file and learning the procedure you want to execute.
   3. Open Chrome in either Guest or Incognito mode (it’s important to have no cookies prior to starting).
   4. Open the Developer Tools.
   5. Open the Network panel.
   6. Select Disable cache and Preserve log.
   7. Clear the existing log by clicking the Clear 🚫 button.
   8. Ensure recording is enabled: the Record button should be red 🔴 (click it to toggle).
   9. Navigate to Kolibri server by entering the URL in the address bar, like http://127.0.0.1:8080 and
      perform your scenario by clicking through the pages, filling in forms, clicking buttons, etc. exactly as the *Gherkin* story from the step 1 explained.
   10. **End recording** by clicking the Record 🔴 button.
   11. **Right-click** on any of the file names listed in the bottom pane of the Network panel.
   12. Select **Save as HAR with content**.
   13. Save the file on your machine.
   14. Repeate the process for each of the Gherking files

2. Convert the *har* file into a Python file to perform the tests:

   1. Create a folder to store the files that are about to be created, for example scenarios/mychannel/
   2. In a console, execute transformer -p plugins.kolibri har/ >scenarios/mychannel/test1.py





### Reproduce and load testing of an user journey



