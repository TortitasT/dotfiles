#!/bin/bash
# I am lazy I know

mkdir ~/.config/nvim
mkdir ~/.config/coc

rm -rf ~/.vimrc
ln -sf $PWD/.vimrc ~/.vimrc

rm -rf ~/.config/nvim/init.lua
ln -sf $PWD/init.lua ~/.config/nvim/init.lua

rm -rf ~/.config/nvim/core
ln -sf $PWD/core ~/.config/nvim/core

rm -rf ~/.config/nvim/lua
ln -sf $PWD/lua ~/.config/nvim/lua

if [[ "$OSTYPE" == "darwin"* ]]; then
  rm -rf ~/.config/nvim/coc-settings.json
  ln -sf $PWD/coc/coc-settings-mac.json ~/.config/nvim/coc-settings.json 
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  rm -rf ~/.config/nvim/coc-settings.json
  ln -sf $PWD/coc/coc-settings-fbsd.json ~/.config/nvim/coc-settings.json
fi

rm -rf ~/.config/nvim/ftplugin
ln -sf $PWD/ftplugin ~/.config/nvim/ftplugin

rm -rf ~/.config/coc/ultisnips
ln -sf $PWD/ultisnips ~/.config/coc/ultisnips
