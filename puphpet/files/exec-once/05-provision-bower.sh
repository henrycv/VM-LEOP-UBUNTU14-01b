#!/usr/bin/env bash

FILENAME_PATH=$PWD/$0
BOWER_COMMAND_INSTALLATION="npm install -g bower"
BOWER_CHECK_UP_OUTPUT="$(bower -v)"

echo "## Bower - $FILENAME_PATH ##"

if [ -n "$BOWER_CHECK_UP_OUTPUT" ];
then
    echo "Bower is already installed:"
    echo "$BOWER_CHECK_UP_OUTPUT!"
    echo "Nothing to do."
    exit
else
   echo "Installing Bower:"
   sudo npm install -g bower
fi
echo "## Bower Done! ##"