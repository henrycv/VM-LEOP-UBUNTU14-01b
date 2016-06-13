#!/usr/bin/env bash

FILENAME_PATH=$PWD/$0
TOOLS_GUEST_DIR_PATH=/home/vagrant/tools

echo "## PROVISION PRE - $FILENAME_PATH ##"

if [! -d "$TOOLS_GUEST_DIR_PATH" ];
then
    echo "The following directory does not exist: $TOOLS_GUEST_DIR_PATH"
    echo "Aborting..."
    exit
fi

echo "Updating and upgrading the OS:"
sudo apt-get -y update > /dev/null
sudo apt-get -y upgrade > /dev/null