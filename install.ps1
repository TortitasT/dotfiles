Write-Host "TortitasT dotfiles configuration script"
Write-Host "======================================"

$OriginalDirectory = Get-Location
Set-Location $PSScriptRoot

. .\utils.ps1

$nvim = Read-Host "Do you want to configure nvim? [Y/n] (n)"
if ($nvim -eq "Y") {
  . .\vim\install.ps1
}

$wallpaper = Read-Host "Do you want to configure wallpaper? [Y/n] (n)"
if ($wallpaper -eq "Y") {
  . .\wallpaper\install.ps1
}

$powershell = Read-Host "Do you want to configure powershell? [Y/n] (n)"
if ($powershell -eq "Y") {
  . .\powershell\install.ps1
}

Set-Location $OriginalDirectory
