#!/bin/bash
# I am lazy I know

cp ./.vimrc ~/.vimrc
cp ./init.vim ~/.config/nvim/init.vim
cp ./coc-settings.json ~/.config/nvim/coc-settings.json
cp -rf ./ftplugin ~/.config/nvim/

read -p "Continue (y/n)? " choice
if [[ $choice != "y" ]]; then
    echo "Exiting..."
    exit 1
fi

nvim +PlugInstall +qall

cocExtensions="coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-java coc-vetur @yaegassy/coc-intelephense coc-sh coc-phpactor @yaegassy/coc-phpstan coc-pyright"

nvim -c "CocInstall $cocExtensions"

