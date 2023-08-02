#/bin/bash

pkg update -y

read -p "Upgrade packages? (y/n)?" choice
case "$choice" in 
  y|Y ) echo "Upgrading packages...";;
  n|N ) exit;;
  * ) echo "exit";;
esac

pkg upgrade -y
