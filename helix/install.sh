#!/bin/bash

source ../lib/installer.sh

ensureDirectory "$HOME/.config/helix"

linkFile "config.toml" "$HOME/.config/helix/config.toml"
