New-Item -ItemType Directory -Force -Path "$HOME\AppData\Local\nvim"

Copy-Item ".\.vimrc" "$HOME\AppData\Local\nvim\init.vim"
Copy-Item ".\coc-settings.json" "$HOME\AppData\Local\nvim\coc-settings.json"

Invoke-Expression "pip3 install --user pynvim"

Write-Host "Run the following command to install coc extensions:"
Write-Host ":PlugInstall"
Write-Host ":CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-java coc-vetur"
