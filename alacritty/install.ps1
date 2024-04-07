New-Item -Path "$env:APPDATA" -Name "alacritty" -ItemType "directory"
Copy-Item -Path "$PSScriptRoot\alacritty.toml" -Destination "$env:APPDATA\alacritty\alacritty.toml" -Recurse -Force
