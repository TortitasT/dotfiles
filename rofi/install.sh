#!/bin/bash

source ../lib/installer.sh

install_themes() {
  git clone https://github.com/lr-tech/rofi-themes-collection.git /tmp/rofi-themes-collection

  mkdir -p ~/.local/share/rofi/themes/

  cp /tmp/rofi-themes-collection/themes/* ~/.local/share/rofi/themes/
}

install_themes
