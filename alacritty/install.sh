#!/bin/bash

source ../lib/installer.sh

ensureDirectory "$HOME/.config/alacritty"

linkFile "alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
