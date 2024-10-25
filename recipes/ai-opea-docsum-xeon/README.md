<p align="center">
  <img src="https://github.com/intel/optimized-cloud-recipes/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Optimized Cloud Modules for Ansible - OPEA DocSum on Intel® Xeon®

## Overview

| Area   | Description                                                 | Links |
| :----- | :---------------------------------------------------------- | :-------- |
| Recipe | **OPEA DocSum on Intel® Xeon® on Ubuntu** ||
Demo | OPEA DocSum on Intel® Xeon® |  [OPEA DocSum](https://github.com/opea-project/GenAIExamples/tree/main/DocSum/docker/xeon) |
| Install time | 15 minutes | |
| Logs | `tail -f /var/log/cloud-init-output.log`| |

## Prerequisites

| Optimized for | Description                              |
| :------------ | :--------------------------------------- |
| OS            | Ubuntu* 22.04 LTS or newer               |
| Hardware      | Intel® Xeon® with Intel® Advanced Matrix Extensions |

**A number of ports need to be opened for this to work correctly, refer to the [OPEA example](https://github.com/opea-project/GenAIExamples/tree/main/DocSum/docker/xeon) for details.**

## Usage

By using [ansible-pull](https://docs.ansible.com/ansible/latest/cli/ansible-pull.html), Ansible can run directly on the host.

For example, on Ubuntu:

```bash
# Install Git 
sudo apt install git -y

# Install Ansible Key
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible


# Install Ansible
sudo apt install ansible -y

# Clone the repo
git clone https://github.com/intel/optimized-cloud-recipes.git

# Modify the opea.sh file and set the `host_ip` variable to your host's IP and uncomment and set your Huggingface Token, then source the opea.sh file
nano recipes/ai-opea-docsum-xeon/opea.sh
source recipes/ai-opea-docsum-xeon/opea.sh

# Run the recipe
sudo ansible-playbook recipes/ai-opea-docsum-xeon/recipe.yml

# Logs at 'tail -f 10 /var/log/syslog'
```

## Accessing the demo

0. Either open port check with cloud provider http://yourpublicip:5174, or tunnel method:

``

1. Open a browser and go to 'http://yourpublicip:5174', or 'http://localhost:5174' (tunnel method) 

2. This will launch the UI for the demo.

## Tips

### Changing the models used

To change the models, stop the containers by running the following:

`docker compose -f /opt/GenAIExamples/DocSum/docker_compose/intel/cpu/xeon/compose.yaml down`

Modify the file `opea.sh` to change the models used. After making the changes you want, re-source the environment variables by running:

`. /opea.sh`

Then relaunch the containers with:

`docker compose -f /opt/GenAIExamples/DocSum/docker_compose/intel/cpu/xeon/compose.yaml up -d`

## Links

[Intel® Advanced Matrix Extensions](https://www.intel.com/content/www/us/en/products/docs/accelerator-engines/advanced-matrix-extensions/overview.html)

[Open Platform for Enterprise AI](https://opea.dev/)
