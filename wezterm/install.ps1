$OriginalDirectory = Get-Location
Set-Location $PSScriptRoot

. .\..\utils.ps1

Print "Configuring Wezterm..." Info

EnsureDirectory "$HOME/.config/wezterm"

LinkFile wezterm.lua "$HOME/.config/wezterm/wezterm.lua"

Print "Wezterm configured!" Success
