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
mkdir ~/.vim

linkFile ".vimrc" "$HOME/.vimrc"

linkFile "init.lua" "$HOME/.config/nvim/init.lua"

linkDirectory "core" "$HOME/.vim/core"
linkDirectory "core" "$HOME/.config/nvim/core"

linkDirectory "lua" "$HOME/.config/nvim/lua"

if [[ "$OSTYPE" == "darwin"* ]]; then
  rm -rf ~/.config/nvim/coc-settings.json
  ln -sf $PWD/coc/coc-settings-mac.json ~/.config/nvim/coc-settings.json 
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  rm -rf ~/.config/nvim/coc-settings.json
  ln -sf $PWD/coc/coc-settings-fbsd.json ~/.config/nvim/coc-settings.json
fi

linkDirectory "ftplugin" "$HOME/.config/nvim/ftplugin"

linkDirectory "ultisnips" "$HOME/.config/coc/ultisnips"

linkDirectory "colors" "$HOME/.vim/colors"
linkDirectory "colors" "$HOME/.config/nvim/colors"

installPhpDebugger() {
  read -p "Install php debugger? (y/n)?" choice
  case "$choice" in 
    y|Y ) echo "Installing php debugger";;
    n|N ) return;;
    * ) return;;
  esac

  VSCODE_PHP_DEBUG_PATH="$HOME/build/vscode-php-debug"

  git clone https://github.com/xdebug/vscode-php-debug.git $VSCODE_PHP_DEBUG_PATH &&
  npm install --prefix $VSCODE_PHP_DEBUG_PATH && npm run --prefix $VSCODE_PHP_DEBUG_PATH build
}

installWakatimeBin() {
  read -p "Install wakatime binary? (y/n)?" choice
  case "$choice" in 
    y|Y ) echo "Installing wakatime binary";;
    n|N ) return;;
    * ) return;;
  esac

  mkdir ~/.wakatime
  curl https://github.com/wakatime/wakatime-cli/releases/download/v1.73.2/wakatime-cli-linux-amd64.zip --output ~/.wakatime/wakatime-cli
}

installPhpDebugger
installWakatimeBin
