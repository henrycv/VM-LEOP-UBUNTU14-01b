#!/usr/bin/env bash

FILENAME_PATH=$PWD/$0
SVN_COMMAND_INSTALLATION="apt-get install subversion"
SVN_CHECK_UP_OUTPUT="$(svn --version)"

echo "## SVN - $FILENAME_PATH ##"

if [ -n "$SVN_CHECK_UP_OUTPUT" ];
then
    echo "SVN is already installed:"
    echo "$SVN_CHECK_UP_OUTPUT!"
    echo "Nothing to do."
    exit
else
   echo "Installing SVN:"
   sudo apt-get install subversion
fi
echo "## SVN Done! ##"