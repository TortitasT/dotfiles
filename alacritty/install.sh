#!/bin/bash

source ../lib/installer.sh

ensureDirectory "$HOME/.config/alacritty"

rm -f "$HOME/.config/alacritty/alacritty.yml"

linkFile "alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
