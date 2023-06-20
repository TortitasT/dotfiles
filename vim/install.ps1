$OriginalDirectory = Get-Location
Set-Location $PSScriptRoot

. .\..\utils.ps1

function Vim-Ensure-Directories {
  $directories = @(
    "$HOME\AppData\Local\nvim",
    "$HOME\AppData\Local\coc"
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
  Copy-Item ".\init.lua" "$HOME\AppData\Local\nvim\init.lua" -Force 1> $null
  Copy-Item ".\coc\coc-settings-windows.json" "$HOME\AppData\Local\nvim\coc-settings.json" -Force 1> $null

  Remove-Item -Recurse -Path "$HOME\AppData\Local\nvim\ftplugin"
  Remove-Item -Recurse -Path "$HOME\AppData\Local\nvim\core"
  Remove-Item -Recurse -Path "$HOME\AppData\Local\nvim\lua"
  Remove-Item -Recurse -Path "$HOME\AppData\Local\coc\ultisnips"

  # Copy-Item -Path ".\ftplugin\" -Destination "$HOME\AppData\Local\nvim\ftplugin" -Recurse
  New-Item -ItemType SymbolicLink -Target "$PWD\ftplugin" -Path "$HOME\AppData\Local\nvim\ftplugin" 

  # Copy-Item -Path ".\core\" -Destination "$HOME\AppData\Local\nvim\core" -Recurse
  New-Item -ItemType SymbolicLink -Target "$PWD\core" -Path "$HOME\AppData\Local\nvim\core" 

  # Copy-Item -Path ".\lua\" -Destination "$HOME\AppData\Local\nvim\lua" -Recurse
  New-Item -ItemType SymbolicLink -Target "$PWD\lua" -Path "$HOME\AppData\Local\nvim\lua" 
  
  # Copy-Item -Path ".\ultisnips\" -Destination "$HOME\AppData\Local\coc\ultisnips" -Recurse
  New-Item -ItemType SymbolicLink -Target "$PWD\ultisnips" -Path "$HOME\AppData\Local\coc\ultisnips" 

  # Vim
  Remove-Item -Path "$HOME\.vimrc" 
  New-Item -ItemType SymbolicLink -Target "$PWD\.vimrc" -Path "$HOME\.vimrc" 

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
  Vim-Copy-Config

  Vim-Install-Python-Deps
  Vim-Fix-Wakatime

  Print "Neovim configured" -Level Info
}

Vim-Install

Set-Location $OriginalDirectory
