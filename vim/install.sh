#!/bin/bash
# I am lazy I know

# cp ./.vimrc ~/.vimrc
ln -s $PWD/.vimrc ~/.vimrc

# cp ./init.lua ~/.config/nvim/init.lua
ln -s $PWD/init.lua ~/.config/nvim/init.lua

# cp -rf ./core ~/.config/nvim
ln -s $PWD/core ~/.config/nvim/core

# cp -rf ./lua ~/.config/nvim
ln -s $PWD/lua ~/.config/nvim/lua

if [[ "$OSTYPE" == "darwin"* ]]; then
  # cp ./coc/coc-settings-mac.json ~/.config/nvim/coc-settings.json
  ln -s $PWD/coc/coc-settings-mac.json ~/.config/nvim/coc-settings.json 
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  # cp ./coc/coc-settings-fbsd.json ~/.config/nvim/coc-settings.json
  ln -s $PWD/coc/coc-settings-fbsd.json ~/.config/nvim/coc-settings.json
fi

# cp -rf ./ftplugin ~/.config/nvim/
ln -s $PWD/ftplugin ~/.config/nvim/ftplugin
