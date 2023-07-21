#!/bin/bash

linkFile() {
  if [ -f $2 ]; then
    rm -rf $2
  fi

  ln -sf $PWD/$1 $2
}

linkDirectory() {
  if [ -d $2 ]; then
    rm -rf $2
  fi

  ln -sf $PWD/$1 $2
}

mkdir ~/.config/nvim
mkdir ~/.config/coc

linkFile ".vimrc" "~/.vimrc"

linkFile "init.lua" "~/.config/nvim/init.lua"

linkDirectory "core" "~/.vim/core"
linkDirectory "core" "~/.config/nvim/core"

linkDirectory "lua" "~/.config/nvim/lua"

if [[ "$OSTYPE" == "darwin"* ]]; then
  rm -rf ~/.config/nvim/coc-settings.json
  ln -sf $PWD/coc/coc-settings-mac.json ~/.config/nvim/coc-settings.json 
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  rm -rf ~/.config/nvim/coc-settings.json
  ln -sf $PWD/coc/coc-settings-fbsd.json ~/.config/nvim/coc-settings.json
fi

linkDirectory "ftplugin" "~/.config/nvim/ftplugin"

linkDirectory "ultisnips" "~/.config/coc/ultisnips"

linkDirectory "colors" "~/.vim/colors"
linkDirectory "colors" "~/.config/nvim/colors"

installPhpDebugger() {
  VSCODE_PHP_DEBUG_PATH="$HOME/build/vscode-php-debug"

  git clone https://github.com/xdebug/vscode-php-debug.git $VSCODE_PHP_DEBUG_PATH &&
  npm install --prefix $VSCODE_PHP_DEBUG_PATH && npm run --prefix $VSCODE_PHP_DEBUG_PATH build
}

installPhpDebugger
