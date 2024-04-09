$OriginalDirectory = Get-Location
Set-Location $PSScriptRoot

. .\..\utils.ps1

function Powershell-Install-OhMyPosh {
  if (Get-Command oh-my-posh.exe -errorAction SilentlyContinue) {
    return
  }

  winget install JanDeDobbeleer.OhMyPosh -s winget
  Get-PoshThemes
}

function Powershell-Install-TerminalIcons {
  if (Get-Module -Name Terminal-Icons -ListAvailable) {
    return
  }

  Install-Module -Name Terminal-Icons -Repository PSGallery
  Import-Module -Name Terminal-Icons
}

function Powershell-Install-Autosuggestions {
  if (Get-Module -Name PSReadLine -ListAvailable) {
    return
  }
  
  Install-Module PSReadLine -RequiredVersion 2.1.0
  Import-Module -Name PSReadLine
}

function Powershell-Link-Profile {
  if (Test-Path $PROFILE -e $true) {
    Move-Item -Path $PROFILE -Destination "$PROFILE.bak" -Force
  }
  New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$PWD\PROFILE.ps1" -Force
}

function Powershell-Install-Fzf {
  winget install fzf
}

Print "Configuring Powershell..." Info

Powershell-Install-OhMyPosh
Powershell-Install-TerminalIcons
Powershell-Install-Autosuggestions
Powershell-Install-Fzf

Powershell-Link-Profile

Print "Powershell configured!" Success

Set-Location $OriginalDirectory








