#!/bin/bash -x

# script to build the edgexfoundry snap on ubuntu
# installs lxd, snapcraft, and then builds the snap 

snap install lxd
snap install snapcraft
lxd init --auto
snapcraft --use-lxd
