#!/bin/bash

source ../lib/installer.sh

ensureDirectories "$HOME/.config" "$HOME/.config/hypr"

linkFile "hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
linkFile "hyprpaper.conf" "$HOME/.config/hypr/hyprpaper.conf"
linkFile "../wallpaper/dark-cat-rosewater.png" "$HOME/.config/hypr/wallpaper"
