#!/bin/bash -eux

# Uninstall Ansible and remove PPA.
sudo apt -y remove --purge ansible
sudo apt-add-repository --remove ppa:ansible/ansible -y

# Apt cleanup.
sudo apt -y autoremove
sudo apt -y update