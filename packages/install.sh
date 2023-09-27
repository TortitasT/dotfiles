#!/bin/bash

source ../lib/installer.sh

packages=`cat $PWD/install.log`
for package in $packages; do
  package=${package::-1}

  archInstallPackage "$package"
done
