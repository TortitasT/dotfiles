#!/bin/bash

# This script is used to setup the wireless interface on a FreeBSD system.

# Check if root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

echo "Packages to update:"
pkg version -v | grep "needs"

# Ask for interface
echo -n "Update all?"
read is_update_all

if [ "$is_update_all" == "y" ]; then
    #pkg upgrade -y
    portupgrade -a
else
    echo "Packages to update:"
    pkg version -v | grep "needs"
    echo -n "Enter package name to update: "
    read package_name
    if [ "$package_name" != "" ]; then
        #pkg upgrade -y $package_name
        portupgrade $package_name
    fi
fi
