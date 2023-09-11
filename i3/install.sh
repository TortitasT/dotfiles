#!/bin/bash

source ../lib/installer.sh

ensureDirectories "$HOME/.config" "$HOME/.config/i3"

linkFile "config" "$HOME/.config/i3/config"
linkFile "wallpaper" "$HOME/.config/i3/wallpaper"
