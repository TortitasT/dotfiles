#!/bin/bash

source ../lib/installer.sh

ensureDirectory "$HOME/.config/polybar"

linkDirectory "." "$HOME/.config/polybar"

# cp ./config.ini ~/.config/polybar/config.ini
# cp ./start.sh ~/.config/polybar/start.sh
#
# rm -rf ~/.config/polybar/plugins
# ln -sf $PWD/plugins ~/.config/polybar/plugins
