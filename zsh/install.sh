#!/bin/bash

# Install .zshrc
cp .zshrc ~/.zshrc

# Install zsh-autosuggestions
if [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  echo "zsh-autosuggestions installed, please add it to your plugins in .zshrc"
fi
