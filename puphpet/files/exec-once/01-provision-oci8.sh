#!/usr/bin/env bash

FILENAME_PATH=$PWD/$0
CHECKING_OUTPUT="$(php -i | grep oci8)"
USER_SRC_DIR_PATH=/home/vagrant
TOOLS_SRC_DIR_PATH=$USER_SRC_DIR_PATH/tools
ZIP_TOOLS_FILE_PATH=$USER_SRC_DIR_PATH/tools-oracle-instantclient-linux.x64-12.1.zip
DEST_TOOLS_DIR_PATH=$USER_SRC_DIR_PATH/tools-oracle-instantclient-linux.x64-12.1
ZIP_BASIC_FILE_PATH=$DEST_TOOLS_DIR_PATH/instantclient-basic-linux.x64-12.1.0.2.0.zip
ZIP_SDK_FILE_PATH=$DEST_TOOLS_DIR_PATH/instantclient-sdk-linux.x64-12.1.0.2.0.zip
DEST_INSTANTCLIENT_DIR_PATH=$DEST_TOOLS_DIR_PATH/instantclient

echo "## PHP OCI8 - $FILENAME_PATH ##"

if [ -n "$CHECKING_OUTPUT" ];
then
    echo "OCI8 is already installed:"
    echo "$CHECKING_OUTPUT!"
    echo "Nothing to do."
    exit
fi

if [ ! -f "$ZIP_TOOLS_FILE_PATH" ];
then
    echo "ERROR: $ZIP_TOOLS_FILE_PATH file does not exist. Aborting ..."
    exit
else
    unzip $ZIP_TOOLS_FILE_PATH -d $TOOLS_SRC_DIR_PATH/ &> /dev/null

    if [ ! -d "$DEST_TOOLS_DIR_PATH" ];
    then
        echo "ERROR: $DEST_TOOLS_DIR_PATH does not exist. Aborting ..."
        exit
    else
        if [ -d "$ORACLE_SRC_DIR_PATH" ];
        then
            echo "Removing old directory: $ORACLE_SRC_DIR_PATH"
            sudo rm -Rf $ORACLE_SRC_DIR_PATH
        fi

        unzip $ZIP_BASIC_FILE_PATH -d $DEST_INSTANTCLIENT_DIR_PATH &> /dev/null
        unzip $ZIP_SDK_FILE_PATH -d $DEST_INSTANTCLIENT_DIR_PATH &> /dev/null
    fi
fi