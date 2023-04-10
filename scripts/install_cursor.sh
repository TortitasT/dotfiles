#!/bin/bash

if [ -z "$1" ]
then
  echo "No file supplied, please supply the tar.gz file of the cursor theme."
  exit 1
fi

tar xvf $1 -C ~/.local/share/icons &&
echo "Icon theme $1 successfully installed, you can use lxappearance command to set up your cursor" ||
echo "Error installing icon theme $1"
