#!/bin/bash

source ../lib/installer.sh

ensureDirectory "$HOME/.config/wezterm"

linkFile wezterm.lua "$HOME/.config/wezterm/wezterm.lua"
