#!/bin/bash

source ../lib/installer.sh

ensureDirectories "$HOME/.config" "$HOME/.config/eww"

linkFile "eww.yuck" "$HOME/.config/eww/eww.yuck"
linkFile "eww.scss" "$HOME/.config/eww/eww.scss"
