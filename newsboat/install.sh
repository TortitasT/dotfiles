#!/bin/bash

# Copy config
cp config ~/.newsboat/config
cp urls ~/.newsboat/urls

# Install theme
curl -o ~/.newsboat/dark https://raw.githubusercontent.com/catppuccin/newsboat/main/themes/dark
