New-Item -Path "$env:APPDATA" -Name "alacritty" -ItemType "directory"
Copy-Item -Path "$PSScriptRoot\alacritty.yml" -Destination "$env:APPDATA\alacritty\alacritty.yml" -Recurse -Force
