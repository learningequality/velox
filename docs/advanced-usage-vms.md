# Virtual Machines

[Velox](../README.md) ⟶ [Detailed documentation](../README.md#detailed-documentation) ⟶ [Advanced usage](../README.md#detailed-documentation) ⟶ Virtual machines


## Overview

This document explains how to run Velox tests using the Virtualbox virtual machines.

You would want to use virtual machines if the underlying hardware you're testing on is too powerful and you would like to limit the resources, or you would like to run the tests by limiting only a part of the computer's resources, e.g. limiting available RAM but not limiting the CPU, or vice-versa.

## Limiting resources

As we're using [Vagrant](https://www.vagrantup.com) to provision the virtual machines, it's fairly easy to configure resources limitations by changing a few configuration options.

By default, resources limitations defined via the `Vagrantfile` are:

| Resource               | Limitation |
| ---------------------- | ---------- |
| RAM memory available   | 4Gb        |
| Number of CPU cores    | 2          |
| Host CPU execution cap | 50%        |

The above listed configuration options can be modified as per your particular needs by changing the appropriate values in the `Vagrantfile` definition:

```
velox.vm.provider 'virtualbox' do |vb|
   vb.memory = 4096
   vb.cpus = 2
   vb.customize ['modifyvm', :id, '--cpuexecutioncap', '50']
end
```

Read more about how to configure the VirtualBox-powered Vagrant virtual machines [here](https://www.vagrantup.com/docs/virtualbox/configuration.html).

## Requirements

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com)
* [Ansible](https://www.ansible.com)

## Setup

###  Install required Ansible packages

* `sudo ansible-galaxy install lborguetti.system-locale`

### Start the virtual machine

* change the working directory to the one where your Velox code is (where `Vagrantfile` is located)
* `vagrant up`

### Provision the virtual machine with Ansible

* `ssh-add .vagrant/machines/velox/virtualbox/private_key` to add the VM's private key to your host machine
* `cd vm_config`
* `ansible-playbook -i inventory.ini main.yml -v` to provision the VM

Note that `-v` argument in the last command is optional and helps to debug potential issues.
Add `-vvvv` to enable to enable connection debugging.

## Running tests inside a virtual machine

If all went well with the installation, you should be able to `ssh` to the VM and run Velox / Kolibri. You can check the [Possible issues](#possible-issues) section if you ran into problems with the VM setup.

Start by `ssh`-ing to the VM:

```vagrant ssh```

Your current working directory, where the Velox is installed, has been automatically mounted inside the VM, so all the changes you make on your host machine will be synced to the VM.

Once successfully connected to the VM, you can run:

* `source ~/.venvs/velox/bin/activate` to activate the Velox virtualenv
* `cd /vagrant` to change working directory to the Velox mounted directory

You're now ready to run Velox, but you will have to explicitly specify the `--kolibri_dev` / `-kd` and `--kolibri_venv` / `-kv` arguments to avoid changing the host `settings.py` file:

```python src/velox.py -kd /home/vagrant/kolibri/ -kv /home/vagrant/.venvs/kolibri/```

All the other parameters will be taken from the host machine `settings.py`, and of course, you can always override them directly within the VM using the CLI arguments, e.g.:

```python src/velox.py -kd /home/vagrant/kolibri/ -kv /home/vagrant/.venvs/kolibri/ -c exercise```

NOTE: PostgreSQL database backend is currently not suppored, so you will only be able to use `sqlite` with the `database` setting for the time being.

## Known issues

### "unreachable: true", "Host key verification failed"
This usually happens if you destroy and re-create vagrant machines (`vagrant destroy` and `vagrant up`) so you have to remove the ssh keys from the old VM.

The following command removes all keys belonging to the VM ip address from your `known_hosts` file:

* `ssh-keygen -f ~/.ssh/known_hosts -R 192.168.109.100`

You should be able to [provision the virtual machine](#provision-the-virtual-machine-with-ansible) now.

### "unreachable=1", "Failed to connect to the host via ssh", "Connection timed out"

This usually happens where you create multiple vagrant instances, the solution should be easy:
* run `ssh-add -l`

to list all identities and confirm that there are more than one identities for vagrant `velox` virtual machines.

If this is the case, you can:
* run `ssh-add -D` to __remove all identities__ from the agent (__Do this only if you know what you're doing!__)
* change the working directory to the one where your Velox code is (where `Vagrantfile` is located)
* `ssh-add .vagrant/machines/velox/virtualbox/private_key` (re-add `velox` private key)
* you probably want to run `ssh-add` as well to re-add your personal ssh identities

------

## Table of Contents

- [Velox](../README.md)
  - [Installation](./installation.md)
  - [Configuration options](./configuration-options.md)
  - [Using Velox](./using-velox.md)
  - [Test results](./test-results.md)
  - Advanced usage
    - **Virtual machines**
    - [Kolibri profiling](./advanced-usage-profiling.md)
