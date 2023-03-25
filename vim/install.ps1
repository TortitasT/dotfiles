function Vim-Ensure-Directories {
  $directories = @(
    "$HOME\AppData\Local\nvim"
  )

  foreach ($directory in $directories) {
    New-Item -ItemType Directory -Force -Path $directory
  }
}

function Vim-Install-Plug {
  # Nvim
  iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

  # Vim 
  iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
}

function Vim-Copy-Config {
  # Nvim
  Copy-Item ".\.vimrc" "$HOME\AppData\Local\nvim\init.vim"
  Copy-Item ".\coc-settings.json" "$HOME\AppData\Local\nvim\coc-settings.json"

  # Vim
  Copy-Item ".\.vimrc" "$HOME\.vimrc"
}

function Vim-Install-Python-Deps {
  Invoke-Expression "pip3 install --user pynvim"
}

function Vim-Install-Plugs {
  Invoke-Expression "nvim +PlugInstall +qall"
}

function Vim-Install-Coc-Plugs {
  $cocplugs = @(
    "coc-tsserver"
    "coc-eslint"
    "coc-json"
    "coc-prettier"
    "coc-css"
    "coc-java"
    "coc-vetur"
  )

  foreach ($cocplug in $cocplugs) {
    Invoke-Expression "nvim +CocInstall $cocplug +qall"
  }
}

function Vim-Fix-Wakatime {
  Move-Item "$HOME\.wakatime\wakatime-cli-windows-amd64.exe" "$HOME\.wakatime\wakatime-cli.exe" -Force -ErrorAction SilentlyContinue
} 

function Vim-Install {
  $OriginalDirectory = Get-Location
  Change-Directory $PSScriptRoot

  Vim-Ensure-Directories
  Vim-Install-Plug
  Vim-Copy-Config
  Vim-Install-Python-Deps
  Vim-Install-Plugs
  Vim-Install-Coc-Plugs
  Vim-Fix-Wakatime

  Change-Directory $OriginalDirectory
}

Vim-Install
