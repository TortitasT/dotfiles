#!/bin/bash

source ../lib/installer.sh

ensureDirectory "$HOME/.config/kitty"

linkFile kitty.conf "$HOME/.config/kitty/kitty.conf"
linkFile current-theme.conf "$HOME/.config/kitty/current-theme.conf"
