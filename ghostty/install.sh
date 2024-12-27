#!/bin/bash

source ../lib/installer.sh

ensureDirectory "$HOME/.config/ghostty"

linkFile "config" "$HOME/.config/ghostty/config"
