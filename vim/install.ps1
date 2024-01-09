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

function Vim-Copy-Config {
  Remove-Item -Recurse -Path "$HOME\AppData\Local\nvim\ftplugin"
  New-Item -ItemType SymbolicLink -Target "$PWD\ftplugin" -Path "$HOME\AppData\Local\nvim\ftplugin" 

  Remove-Item -Recurse -Path "$HOME\AppData\Local\nvim\core"
  New-Item -ItemType SymbolicLink -Target "$PWD\core" -Path "$HOME\AppData\Local\nvim\core" 

  Remove-Item -Recurse -Path "$HOME\AppData\Local\nvim\lua"
  New-Item -ItemType SymbolicLink -Target "$PWD\lua" -Path "$HOME\AppData\Local\nvim\lua" 
  
  Remove-Item -Recurse -Path "$HOME\AppData\Local\coc\ultisnips"
  New-Item -ItemType SymbolicLink -Target "$PWD\ultisnips" -Path "$HOME\AppData\Local\coc\ultisnips" 

  Remove-Item -Path "$HOME\.vimrc" 
  New-Item -ItemType SymbolicLink -Target "$PWD\.vimrc" -Path "$HOME\.vimrc" 
  
  Remove-Item -Recurse -Path "$HOME\AppData\Local\nvim\init.lua"
  New-Item -ItemType SymbolicLink -Target "$PWD\init.lua" -Path "$HOME\AppData\Local\nvim\init.lua" 

  Remove-Item -Recurse -Path "$HOME\AppData\Local\nvim\coc-settings.json"
  New-Item -ItemType SymbolicLink -Target "$PWD\coc\coc-settings-windows.json" -Path "$HOME\AppData\Local\nvim\coc-settings.json"

  Remove-Item -Recurse -Path "$HOME\AppData\Local\nvim\filetype.lua"
  New-Item -ItemType SymbolicLink -Target "$PWD\filetype.lua" -Path "$HOME\AppData\Local\nvim\filetype.lua"

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

function Vim-Install {
  Print "Configuring neovim" -Level Info

  Vim-Ensure-Directories
  Vim-Copy-Config

  Vim-Install-Python-Deps
  Vim-Fix-Wakatime

  Print "Neovim configured" -Level Info
}

Vim-Install

Set-Location $OriginalDirectory
