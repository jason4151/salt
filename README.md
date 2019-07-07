# Salt

![SaltStack Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Saltstack_logo.png/320px-Saltstack_logo.png)

This repository utilizes the open source version of SaltStack (Salt for sort). AWS CodeDeploy is used for deploying the code to the Salt Master EC2 instances.

Salt is a Python-based configuration management tool that was developed to bring the best solutions found in the world of remote execution together and make them better, faster, and more malleable. Salt is capable of maintaining remote nodes in defined states, i.e., ensuring that specific packages are installed, and specific services are running. The various services within the deployment are separated into functional roles so that they can be grouped within Salt’s State system. The Salt State system uses SLS, or **S**a**L**t **S**tate files. An SLS file represents the state in which a system should be in and is set up to contain this data in a simple format written in YAML.

Salt, in its typical deployment uses the concept of clients, called "minions", which can be commanded and controlled from a central command server called a "master". Directions are issued to the minions via the master by calling a client script simply called, 'salt' and instructing it to run a specific configuration. Each minion contains an install of the salt-minion application. It can either operate as a stand-alone daemon and commands locally via 'salt-call' or it can connect back to a master and receive commands remotely.

This repository is organized into 5 directories. The ‘deploy_hooks’ directory contains CodeDeploy lifecycle event scripts that will be executed during a CodeDeploy. These lifecycle scripts are responsible for starting, stopping and verifying the Salt Master service during a CodeDeploy. The ‘master.d’ directory contains the Salt Master configuration files that will be deployed to the Salt Master EC2 instance. These configuration files do everything from setting the location of the state files to telling the Salt Master to authorize the public keys of the Salt Minions that wish to connect to the Salt Master. The ‘minion.d’ directory contains the Salt Minion configuration files that will be deployed to the Salt Minions. The ‘pillars’ and ‘states’ directories contain pillar and state files respectively.

The ‘states’ directory in this project contains Salt states which are used for various configurations. The first ‘amazon_time_sync.sls’ is used for configuring chrony, which keeps the system clock in sync with AWS Network Time Protocol (NTP) systems. The following table shows the code that is used in this state file. The first section uses the pkg.remove method to remove the pre-installed ntp package. The second method uses pkg.latest to install chrony in place of NTP. The third method uses file.managed to set the permissions/ownership of the /etc/chrony.conf file and then set the IP address of the AWS system to contact for time data. The last method in the state uses a service.running method to ensure that the chronyd process has running.

The ‘states/cis/init.sls’ contains over 40 Amazon Linux hardening states that were developed using the CIS Amazon Linux 2 Benchmark document. This document provides prescriptive guidance for establishing a secure configuration posture for Amazon Linux 2 systems running on AWS. Executing these states on all Amazon Linux systems within the VPC ensures that they have been secured following industry best security practices and further enforces the idea of a layered security approach.

* https://saltstack.com
* https://docs.aws.amazon.com/codedeploy
* https://www.cisecurity.org
