function Write-Color([String[]]$Text, [ConsoleColor[]]$Color) {
  for ($i = 0; $i -lt $Text.Length; $i++) {
    Write-Host $Text[$i] -Foreground $Color[$i] -NoNewLine
  }
  Write-Host
}

enum PrintLevels {
  Info = 1
  Warn = 6
  Error = 4
  Success = 2
}

function Print([String] $Text, [PrintLevels] $Level = [PrintLevels]::Info) {
  $Prefix = switch ($Level) {
    Info { "[ INFO ] " }
    Warn { "[ WARN ] " }
    Error { "[ ERROR ] " }
    Success { "[ OK ] " }
  }

  Write-Color -Text $Prefix, $Text -Color $Level, White
}
