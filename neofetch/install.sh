#!/bin/bash

source ../lib/installer.sh

ensureDirectories "$HOME/.config" "$HOME/.config/neofetch"

linkFile "config.conf" "$HOME/.config/neofetch/config.conf"
linkFile "tux.png" "$HOME/.config/neofetch/tux.png"
