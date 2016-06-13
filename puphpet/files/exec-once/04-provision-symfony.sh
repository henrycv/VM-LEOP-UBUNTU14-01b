#!/usr/bin/env bash

FILENAME_PATH=$PWD/$0
SYMFONY_PATH=/usr/local/bin/symfony
SYMFONY_URL=https://symfony.com/installer

echo "## Symfony - $FILENAME_PATH ##"

echo "Installing Symfony: $SYMFONY_URL; in: $SYMFONY_PATH"
if [ -f "$SYMFONY_PATH" ];
then
   sudo rm -Rf $SYMFONY_PATH
fi
sudo curl -LsS $SYMFONY_URL -o $SYMFONY_PATH
sudo chmod a+x $SYMFONY_PATH
if [ -f "$SYMFONY_PATH" ];
then
   echo "Symfony, succesfully installed"
fi

echo "## Symfony - Done! ##"