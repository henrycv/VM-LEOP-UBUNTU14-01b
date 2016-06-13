#!/usr/bin/env bash

FILENAME_PATH=$PWD/$0
PHPUNIT_PATH=/usr/local/bin/phpunit
PHPUNIT_URL=https://phar.phpunit.de/phpunit.phar

echo "## PHPUnit - $FILENAME_PATH ##"

echo "Installing PHPUnit: $PHPUNIT_URL; in: $PHPUNIT_PATH"
if [ -f "$PHPUNIT_PATH" ];
then
   sudo rm -Rf $PHPUNIT_PATH
fi

sudo curl -LsS $PHPUNIT_URL -o $PHPUNIT_PATH
sudo chmod a+x $PHPUNIT_PATH
if [ -f "$PHPUNIT_PATH" ];
then
   echo "PHPUnit, succesfully installed"
fi

echo "## PHPUnit - Done! ##"
