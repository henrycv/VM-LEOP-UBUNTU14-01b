#!/usr/bin/env bash

FILENAME_PATH=$PWD/$0
USER_NAME=vagrant
USER_PASS=vagrant

echo "## Pre Provissions - $FILENAME_PATH ##"

echo "Updating the password ($USER_PASS) for '$USER_NAME' user ..."
usermod -p $(echo $USER_PASS | openssl passwd -1 -stdin) $USER_NAME

echo "## Pre Provissions - Done! ##"