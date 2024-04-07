$OriginalDirectory = Get-Location
Set-Location $PSScriptRoot

. .\..\utils.ps1

function Powershell-Install-OhMyPosh {
  winget install JanDeDobbeleer.OhMyPosh -s winget
  Get-PoshThemes
}

function Powershell-Install-TerminalIcons {
  Install-Module -Name Terminal-Icons -Repository PSGallery
  Import-Module -Name Terminal-Icons
}

function Powershell-Install-Autosuggestions {
  Install-Module PSReadLine -RequiredVersion 2.1.0
  Import-Module -Name PSReadLine
}

function Powershell-Copy-Profile {
  if (Test-Path $PROFILE -ne $true) {
    New-Item -ItemType File -Path $PROFILE -Force
  }
 
  Copy-Item -Path ".\PROFILE.ps1" -Destination $PROFILE -Force
}

function Powershell-Link-Profile {
  if (Test-Path $PROFILE -e $true) {
    Move-Item -Path $PROFILE -Destination "$PROFILE.bak"
  }
  New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$PWD\PROFILE.ps1"
}

Print "Configuring Powershell..." Info

# Powershell-Install-OhMyPosh
# Powershell-Install-TerminalIcons
# Powershell-Install-Autosuggestions

Powershell-Link-Profile

Print "Powershell configured!" Success

Set-Location $OriginalDirectory








