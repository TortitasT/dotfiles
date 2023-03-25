function Wallpaper-Install {
  $path = "$($PSScriptRoot)\dark-cat-rosewater.png"

  $finalPath = "$env:USERPROFILE\Pictures\dark-cat-rosewater.png"

  Copy-Item -Path $path -Destination $finalPath -Force

  Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $finalPath
  rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

Wallpaper-Install
