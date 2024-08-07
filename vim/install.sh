#!/bin/bash

source ../lib/installer.sh

installCocSettings() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    linkFile "coc/coc-settings-mac.json" "$HOME/.config/nvim/coc-settings.json"
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    linkFile "coc/coc-settings-fbsd.json" "$HOME/.config/nvim/coc-settings.json"
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    linkFile "coc/coc-settings-arch.json" "$HOME/.config/nvim/coc-settings.json"
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

installKotlinLSP() {
  prompt "Install Kotlin LSP?"
  if [[ $? -eq 1 ]]; then
    return
  fi

  curl -s https://api.github.com/repos/fwcd/kotlin-language-server/releases/latest \
  | grep "server.*zip" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget -qi - -O /tmp/kotlin-lsp.zip

  unzip /tmp/kotlin-lsp.zip -d /tmp/kotlin-lsp
  mv /tmp/kotlin-lsp/server ~/.local/share/kotlin-language-server
}

installNeovimAppImage() {
  prompt "Install Neovim AppImage? (In case you are using WSL Ubuntu or something)"
  if [[ $? -eq 1 ]]; then
    return
  fi

  # needed to run appimages
  sudo apt install libfuse2

  INSTALL_DIR=$HOME/.local/bin
  ensureDirectory $INSTALL_DIR

  TMP_DIR=/tmp/nvim-install
  ensureDirectory $TMP_DIR
  curl -L "https://github.com/neovim/neovim/releases/latest/download/nvim.appimage" --output $TMP_DIR/nvim.appimage

  chmod u+x $TMP_DIR/nvim.appimage
  mv $TMP_DIR/nvim.appimage $INSTALL_DIR/nvim
}

ensureDirectories "$HOME/.config" "$HOME/.config/nvim" "$HOME/.config/coc" "$HOME/.vim"

linkFile ".vimrc" "$HOME/.vimrc"

linkFile "init.lua" "$HOME/.config/nvim/init.lua"

linkFile "filetype.lua" "$HOME/.config/nvim/filetype.lua"

linkDirectory "core" "$HOME/.vim/core"
linkDirectory "core" "$HOME/.config/nvim/core"

linkDirectory "lua" "$HOME/.config/nvim/lua"
linkDirectory "ftplugin" "$HOME/.config/nvim/ftplugin"
linkDirectory "ultisnips" "$HOME/.config/coc/ultisnips"

linkDirectory "colors" "$HOME/.vim/colors"
linkDirectory "colors" "$HOME/.config/nvim/colors"

linkDirectory "efm-langserver" "$HOME/.config/efm-langserver"

installCocSettings

installNeovimAppImage
installKotlinLSP
installPhpDebugger
installWakatimeBin

print "info" "If you get an error about missing spell files, run ':set spell spelllang=es'"
