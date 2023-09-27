#!/bin/bash

source ../lib/installer.sh

# Install a plugin on .zsh/plugins if it doesn't exist.
#
# $1 - The name of the plugin. This is the name of the repo on GitHub. (including the author name)
function installPlugin() {
  local name=$1
  local name_without_author=$(echo $name | cut -d'/' -f 2)

  if [ ! -d ~/.zsh/plugins/$name_without_author ]; then # TODO: name includes author name so this won't work
    local og_path=$PWD
    cd ~/.zsh/plugins
    
    git clone https://github.com/$name.git

    cd $og_path

    print "success" "Installed plugin $name"
  fi

  print "info" "Plugin $name already installed"
}

# Install a theme on .zsh/themes if it doesn't exist.
#
# $1 - The name of the theme. This is the name of the repo on GitHub. (including the author name)
function installTheme() {
  local name=$1
  local name_without_author=$(echo $name | cut -d'/' -f 2)

  if [ ! -d ~/.zsh/themes/$name_without_author ]; then # TODO: name includes author name so this won't work
    local og_path=$PWD
    cd ~/.zsh/themes

    git clone https://github.com/$name.git

    cd $og_path

    print "success" "Installed theme $name"
  fi

  print "info" "Theme $name already installed"
}

function installSshAgentService() {
  local has_systemd=$(command -v systemctl)
  local is_linux=$(uname -a | grep -i linux)

  if [ -z "$has_systemd" ] && [ -z "$is_linux" ]; then
    return
  fi

  local service_path="$HOME/.config/systemd/user/ssh-agent.service"

  mkdir -p "$HOME/.config/systemd/user"
  cp "$PWD/ssh-agent.service" "$service_path"

  systemctl --user enable ssh-agent.service
}

installSshAgentService

# Ensure dirs
ensureDirectories ~/.zsh ~/.zsh/plugins ~/.zsh/themes

# Install plugins
installPlugin "zdharma-zmirror/fast-syntax-highlighting"
installPlugin "zsh-users/zsh-autosuggestions"
installPlugin "zsh-users/zsh-completions"

# Install themes
installTheme "spaceship-prompt/spaceship-prompt"

# Symlink files
linkFile "zshrc" "$HOME/.zshrc"

