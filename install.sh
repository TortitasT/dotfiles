#!/bin/bash

# Install scripts
read -p "Do you want to install the scripts? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
  mkdir -p ~/.local/bin
  chmod +x scripts/*
  cp -r scripts/* ~/.local/bin/
fi

# Install vim
read -p "Do you want to install vim? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  source vim/install.sh
fi

# Install browser
read -p "Do you want to install browser? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  source browser/install.sh
fi

# Install alacritty
read -p "Do you want to install alacritty? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  source alacritty/install.sh
fi

# Install zsh
read -p "Do you want to install zsh? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  source zsh/install.sh
fi

