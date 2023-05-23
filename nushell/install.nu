mut nushellConfigPath = "~/.config/nushell/config.nu"
mut nushellEnvPath = "~/.config/nushell/env.nu"

if $nu.os-info.name == "windows" {
  $nushellConfigPath = $"($env.APPDATA)\\nushell\\config.nu"
  $nushellEnvPath = $"($env.APPDATA)\\nushell\\env.nu"
}


cp config.nu $nushellConfigPath
cp env.nu $nushellEnvPath
