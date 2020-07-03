#!/bin/bash

set -e

# Tools
apt-get install -y moreutils

# Python
sudo apt-get install -y libssl-dev python3-pip python-pip

# NodeJS
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Libvirt and Vagrant
sudo apt-get install -y libvirt-daemon-system vagrant vagrant-libvirt
