#!/bin/bash

source ../lib/installer.sh

ensureDirectories "$HOME/.config" "$HOME/.config/eww"

linkFile "eww.yuck" "$HOME/.config/eww/eww.yuck"
linkFile "eww.scss" "$HOME/.config/eww/eww.scss"

installEww() {
  curl -sS https://github.com/elkowar.gpg | gpg --import -i -
  curl -sS https://github.com/web-flow.gpg | gpg --import -i -

  install eww
}

if ! isCommandInstalled eww; then
  installEww
fi
