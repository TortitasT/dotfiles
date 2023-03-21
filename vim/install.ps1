New-Item -ItemType Directory -Force -Path "$HOME\AppData\Local\nvim"

Copy-Item ".\.vimrc" "$HOME\AppData\Local\nvim\init.vim"
Copy-Item ".\coc-settings.json" "$HOME\AppData\Local\nvim\coc-settings.json"
