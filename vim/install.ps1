$OriginalDirectory = Get-Location
Set-Location $PSScriptRoot

. .\..\utils.ps1

function Vim-Ensure-Directories {
  $directories = @(
    "$HOME\AppData\Local\nvim"
  )

  foreach ($directory in $directories) {
    New-Item -ItemType Directory -Force -Path $directory 1>$null
  }
}

function Vim-Install-Plug {
  if (Test-Path "$HOME/vimfiles/autoload/plug.vim") {
    Print "vim-plug is already installed" -Level Success
    return
  }

  # Nvim
  Print "Installing vim-plug for nvim..." -Level Warn  
  iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

  # Vim 
  #iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
  #ni $HOME/vimfiles/autoload/plug.vim -Force
}

function Vim-Copy-Config {
  # Nvim
  Copy-Item ".\.vimrc" "$HOME\AppData\Local\nvim\init.vim" -Force 1> $null
  Copy-Item ".\coc-settings.json" "$HOME\AppData\Local\nvim\coc-settings.json" -Force 1> $null

  # Vim
  Copy-Item ".\.vimrc" "$HOME\.vimrc" -Force 1> $null

  Print "Config files copied" -Level Success
}

function Vim-Install-Python-Deps {
  $pythonInstalledPackages = Invoke-Expression "pip3 list --user --format=freeze" | ForEach-Object { $_.Split("=")[0] }

  if ($pythonInstalledPackages -contains "pynvim") {
    Print "pynvim already installed" -Level Success
    return
  }

  Print "Installing pynvim..." -Level Warn
  Invoke-Expression "pip3 install --user pynvim"
}

function Vim-Install-Plugs {
  Start-Job -ScriptBlock { Invoke-Expression "nvim +PlugInstall +qall" } | Wait-Job 1> $null

  Print "Plugins installed" -Level Success
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
    "coc-powershell"
    "coc-lua"
    "coc-deno"
    "coc-phpls"
  )

  foreach ($cocplug in $cocplugs) {
    Start-Job -ScriptBlock { Invoke-Expression "nvim +CocInstall $cocplug +qall" } | Wait-Job 1> $null

    Print "$cocplug installed" -Level Success
  }

  Print "Coc plugins installed" -Level Success
}

function Vim-Fix-Wakatime {
  Move-Item "$HOME\.wakatime\wakatime-cli-windows-amd64.exe" "$HOME\.wakatime\wakatime-cli.exe" -Force -ErrorAction SilentlyContinue
} 

function Vim-Install-Nvim {
  if ($null -ne (Get-Command "nvim" -ErrorAction SilentlyContinue)) {
    Print "Neovim already installed" -Level Success
    return
  }
  
  Print "Installing Neovim..." -Level Warn
  Invoke-Expression "winget install Neovim.Neovim"
}

function Vim-Install {
  Print "Configuring neovim" -Level Info

  Vim-Install-Nvim
  Vim-Ensure-Directories
  Vim-Install-Plug
  Vim-Copy-Config
  Vim-Install-Python-Deps
  Vim-Install-Plugs
  Vim-Install-Coc-Plugs
  Vim-Fix-Wakatime

  Print "Neovim configured" -Level Info
}

Vim-Install

Set-Location $OriginalDirectory
