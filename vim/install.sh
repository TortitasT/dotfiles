#!/bin/bash

source ../lib/installer.sh

installCocSettings() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    linkFile "coc-settings-mac.json" "$HOME/.config/nvim/coc-settings.json"
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    linkFile "coc-settings-fbsd.json" "$HOME/.config/nvim/coc-settings.json"
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    linkFile "coc-settings-arch.json" "$HOME/.config/nvim/coc-settings.json"
  fi
}

installPhpDebugger() {
  prompt "Install php debugger?"
  if [[ $? -eq 1 ]]; then
    return
  fi

  VSCODE_PHP_DEBUG_PATH="$HOME/build/vscode-php-debug"

  git clone https://github.com/xdebug/vscode-php-debug.git $VSCODE_PHP_DEBUG_PATH &&
  npm install --prefix $VSCODE_PHP_DEBUG_PATH && npm run --prefix $VSCODE_PHP_DEBUG_PATH build
}

installWakatimeBin() {
  prompt "Install wakatime binary?"
  if [[ $? -eq 1 ]]; then
    return
  fi

  mkdir -p ~/.wakatime
  curl https://github.com/wakatime/wakatime-cli/releases/download/v1.73.2/wakatime-cli-linux-amd64.zip --output ~/.wakatime/wakatime-cli
}

ensureDirectories "~/.config/nvim" "~/.config/coc" "~/.vim"

linkFile ".vimrc" "$HOME/.vimrc"

linkFile "init.lua" "$HOME/.config/nvim/init.lua"

linkDirectory "core" "$HOME/.vim/core"
linkDirectory "core" "$HOME/.config/nvim/core"

linkDirectory "lua" "$HOME/.config/nvim/lua"
linkDirectory "ftplugin" "$HOME/.config/nvim/ftplugin"
linkDirectory "ultisnips" "$HOME/.config/coc/ultisnips"

linkDirectory "colors" "$HOME/.vim/colors"
linkDirectory "colors" "$HOME/.config/nvim/colors"

installCocSettings

installPhpDebugger
installWakatimeBin
