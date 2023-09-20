#!/bin/bash

source ../lib/installer.sh

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

ensureDirectory "$HOME/.config/tmux"
linkFile "tmux.conf" "$HOME/.config/tmux/tmux.conf"
