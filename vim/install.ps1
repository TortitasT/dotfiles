New-Item -ItemType Directory -Force -Path "$HOME\AppData\Local\nvim"

Copy-Item ".\.vimrc" "$HOME\AppData\Local\nvim\init.vim"