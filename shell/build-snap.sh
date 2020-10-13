#!/bin/bash -x

# script to build the edgexfoundry snap on ubuntu
# installs lxd, snapcraft, and then builds the snap 

# remove lxd
sudo apt-get remove -qy --purge lxd lxd-client
sudo snap remove --purge lxd
# set up lxd group
sudo groupadd --force --system lxd
sudo /usr/sbin/usermod -G lxd -a `whoami`
newgrp - lxd
#install lxd
sudo snap install lxd
sudo lxd init --auto
# install snapcraft
sudo snap install --classic snapcraft
# run snapcraft
sg lxd "snapcraft --use-lxd"
