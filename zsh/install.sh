#!/bin/bash

# Ensure directories exist.
#
# $@ - The directories to ensure exist.
function ensureDirs() {
  local dirs=("$@")

  for dir in "${dirs[@]}"; do
    if [ ! -d $dir ]; then
      mkdir -p $dir
    fi
  done
}

# Install a plugin on .zsh/plugins if it doesn't exist.
#
# $1 - The name of the plugin. This is the name of the repo on GitHub. (including the author name)
function installPlugin() {
  local name=$1

  if [ ! -d ~/.zsh/plugins/$name ]; then # TODO: name includes author name so this won't work
    local og_path=$PWD
    cd ~/.zsh/plugins
    
    git clone https://github.com/$name.git

    cd $og_path
  fi
}

# Install a theme on .zsh/themes if it doesn't exist.
#
# $1 - The name of the theme. This is the name of the repo on GitHub. (including the author name)
function installTheme() {
  local name=$1

  if [ ! -d ~/.zsh/themes/$name ]; then # TODO: name includes author name so this won't work
    local og_path=$PWD
    cd ~/.zsh/themes

    git clone https://github.com/$name.git

    cd $og_path
  fi
}

# Ensure dirs
ensureDirs ~/.zsh ~/.zsh/plugins ~/.zsh/themes

# Install plugins
installPlugin "zdharma-zmirror/fast-syntax-highlighting"
installPlugin "zsh-users/zsh-autosuggestions"
installPlugin "zsh-users/zsh-completions"

# Install themes
installTheme "spaceship-prompt/spaceship-prompt"

# Copy config
# cp .zshrc ~/.zshrc

# Symbolic link config
ln -s $PWD/.zshrc ~/.zshrc

