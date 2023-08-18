#!/bin/bash

source ../lib/installer.sh

linkFile "xinitrc" "$HOME/.xinitrc"

systemctl --user enable pulseaudio
