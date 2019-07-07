# Salt

![SaltStack Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Saltstack_logo.png/320px-Saltstack_logo.png)

This repository utilizes the open source version of SaltStack (Salt for sort). AWS CodeDeploy is used for deploying the code to the Salt Master EC2 instances.

Salt is a Python-based configuration management tool that was developed to bring the best solutions found in the world of remote execution together and make them better, faster, and more malleable. Salt is capable of maintaining remote nodes in defined states, i.e., ensuring that specific packages are installed, and specific services are running. The various services within the deployment are separated into functional roles so that they can be grouped within Salt’s State system. The Salt State system uses SLS, or SaLt State files. An SLS file represents the state in which a system should be in and is set up to contain this data in a simple format written in YAML.

Salt, in its typical deployment uses the concept of clients, called "minions", which can be commanded and controlled from a central command server called a "master". Directions are issued to the minions via the master by calling a client script simply called, 'salt' and instructing it to run a specific configuration. Each minion contains an install of the salt-minion application. It can either operate as a stand-alone daemon and commands locally via 'salt-call' or it can connect back to a master and receive commands remotely.

* https://saltstack.com
* https://docs.aws.amazon.com/codedeploy
