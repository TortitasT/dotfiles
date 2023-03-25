Write-Host "TortitasT dotfiles configuration script"
Write-Host "======================================"

$nvim = Read-Host "Do you want to configure nvim? [Y/n]"
if ($nvim -eq "Y") {
  Write-Host "Configuring nvim..."
  . .\vim\install.ps1
}

$wallpaper = Read-Host "Do you want to configure wallpaper? [Y/n]"
if ($wallpaper -eq "Y") {
  Write-Host "Configuring wallpaper..."
  . .\wallpaper\install.ps1
}
