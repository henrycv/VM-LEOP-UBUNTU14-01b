#!/usr/bin/env bash

FILENAME_PATH=$PWD/$0
USER_SRC_DIR_PATH=/home/vagrant
TOOLS_SRC_DIR_PATH=$USER_SRC_DIR_PATH/tools
ZIP_TOOLS_FILE_PATH=$TOOLS_SRC_DIR_PATH/tools-vm-leop-ubuntu14-01a.zip
DEST_TOOLS_DIR_PATH=$TOOLS_SRC_DIR_PATH/tools-vm-leop-ubuntu14-01a
VHOST_DEF_DIR_PATH=/etc/nginx/sites-enabled
VHOST_DEF_LINK_PATH=/etc/nginx/sites-enabled/_.conf
VHOST_SRC_FILE_PATH=$DEST_TOOLS_DIR_PATH/sga.dev.conf.txt
VHOST_DEST_FILE_PATH=/etc/nginx/sites-available/sga.dev.conf
VHOST_DEST_LINK_PATH=/etc/nginx/sites-enabled/sga.dev.conf

echo "## NGINX Virtualhost - $FILENAME_PATH ##"

if [ ! -f "$ZIP_TOOLS_FILE_PATH" ];
then
    echo "ERROR: $ZIP_TOOLS_FILE_PATH file does not exist. Aborting ..."
    exit
else

    if [ -d "$DEST_TOOLS_DIR_PATH" ];
    then
        sudo rm -Rf $DEST_TOOLS_DIR_PATH
    fi

    unzip $ZIP_TOOLS_FILE_PATH -d $TOOLS_SRC_DIR_PATH/ &> /dev/null

    if [ ! -d "$DEST_TOOLS_DIR_PATH" ];
    then
        echo "ERROR: $DEST_TOOLS_DIR_PATH directory does not exist. Aborting ..."
        exit
    else
        if [ -d "$VHOST_DEF_DIR_PATH" ];
        then
            echo "Removing all default vhosts symbolic links in: $VHOST_DEF_DIR_PATH"
            sudo rm -Rf $VHOST_DEF_DIR_PATH/*
        fi

        if [ -d "$VHOST_DEF_DIR_PATH" ];
        then
            echo "Removing all default vhosts symbolic links in: $VHOST_DEF_DIR_PATH"
            sudo rm -Rf $VHOST_DEF_DIR_PATH/*
        fi

        echo "Setting up the 'sga.dev' vhost: $VHOST_SRC_FILE_PATH; for: $VHOST_DEST_FILE_PATH"
        if [ -f "$VHOST_DEST_FILE_PATH" ];
        then
           sudo rm -Rf $VHOST_DEST_FILE_PATH
        fi

        sudo cp $VHOST_SRC_FILE_PATH $VHOST_DEST_FILE_PATH
        sudo ln -s $VHOST_DEST_FILE_PATH $VHOST_DEST_LINK_PATH
        sudo /etc/init.d/nginx force-reload

        echo "## NGINX Virtualhost - Done! ##"
    fi
fi

