#!/bin/bash

INSTALL_PATH=/usr/local/bin

for script in $(ls -1 *.sh); do
    if [ $script == "install.sh" ]; then
      continue
    fi

    echo "Installing $script"

    if [ ! -d $INSTALL_PATH ]; then
        mkdir -p $INSTALL_PATH
    fi

    scriptname=$(echo $script | cut -d'.' -f1)

    cp $script $INSTALL_PATH/$scriptname
    chmod +x $INSTALL_PATH/$scriptname
done
