#!/bin/bash

mkdir ~/.config/polybar

cp ./config.ini ~/.config/polybar/config.ini
cp ./start.sh ~/.config/polybar/start.sh

rm -rf ~/.config/polybar/plugins
ln -sf $PWD/plugins ~/.config/polybar/plugins
