#!/bin/bash

INSTALL_PATH=/usr/local/bin
if [ "$(uname)" == "Darwin" ]; then
  INSTALL_PATH=~/.local/bin
fi


for script in $(ls -1 *.sh); do
    if [ $script == "install.sh" ]; then
      continue
    fi

    echo "Installing $script"

    if [ ! -d $INSTALL_PATH ]; then
        mkdir -p $INSTALL_PATH
    fi

    scriptname=$(echo $script | cut -d'.' -f1)
    scriptname=",${scriptname}"

    rm -f $INSTALL_PATH/$scriptname
    ln -s $PWD/$script $INSTALL_PATH/$scriptname
    chmod +x $INSTALL_PATH/$scriptname
done
