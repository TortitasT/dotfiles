#!/bin/bash

mkdir ~/.config/polybar

cp ./config.ini ~/.config/polybar/config.ini
cp ./start.sh ~/.config/polybar/start.sh
ln -s $PWD/plugins ~/.config/polybar/plugins
