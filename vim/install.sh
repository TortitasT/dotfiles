#!/bin/bash
# I am lazy I know

cp ./.vimrc ~/.vimrc
cp ./init.lua ~/.config/nvim/init.lua
cp -rf ./core ~/.config/nvim
cp -rf ./lua ~/.config/nvim
cp ./coc-settings.json ~/.config/nvim/coc-settings.json
cp -rf ./ftplugin ~/.config/nvim/

read -p "Continue (y/n)? " choice
if [[ $choice != "y" ]]; then
    echo "Exiting..."
    exit 1
fi

cocExtensions="coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-java coc-vetur @yaegassy/coc-intelephense coc-sh @yaegassy/coc-phpstan coc-pyright"

nvim -c "CocInstall $cocExtensions"

