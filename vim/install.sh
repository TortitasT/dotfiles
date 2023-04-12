#!/bin/sh
# I am lazy I know

cp ./.vimrc ~/.vimrc
cp ./init.vim ~/.config/nvim/init.vim
cp ./coc-settings.json ~/.config/nvim/coc-settings.json
cp -rf ./ftplugin ~/.config/nvim/

# Continue?
echo "Continue? (y/n)"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Installing..."
else
    echo "Aborting..."
    exit 1
fi

nvim +PlugInstall +qall

cocExtensions="coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-java coc-vetur @yaegassy/coc-intelephense coc-sh coc-blade @yaegassy/coc-phpstan coc-pyright"

nvim -c "CocInstall $cocExtensions"

