#!/bin/bash

# Install scripts
read -p "Do you want to install the scripts? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
  mkdir -p ~/bin
  chmod +x scripts/*
  cp -r scripts/* ~/bin/
fi

# Install vim
read -p "Do you want to install vim? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  source vim/install.sh
fi

