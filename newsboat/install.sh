#!/bin/bash

# Copy config
rm ~/.newsboat/config
ln -s $PWD/config ~/.newsboat/config

rm ~/.newsboat/urls
ln -s $PWD/urls ~/.newsboat/urls

# Install theme
curl -o ~/.newsboat/dark https://raw.githubusercontent.com/catppuccin/newsboat/main/themes/dark
