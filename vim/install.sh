#!/bin/sh
# I am lazy I know

cp ./.vimrc ~/.vimrc
cp ./.vimrc ~/.config/nvim/init.vim
cp ./coc-settings.json ~/.config/nvim/coc-settings.json

echo "Run the following command to install coc extensions:"
echo ":CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-java"
