#!/bin/bash

source ../lib/installer.sh

ensureDirectory "$HOME/.config/zed"

linkFile "settings.json" "$HOME/.config/zed/settings.json"
linkFile "keymap.json" "$HOME/.config/zed/keymap.json"
