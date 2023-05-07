$cwd = Get-Location
$cssUrl = 'https://raw.githubusercontent.com/tortitast/dotfiles/master/pandoc/pandoc.css'

Invoke-WebRequest $cssUrl -OutFile '$cwd\pandoc.css'

while (!(Test-Path ./pandoc.css)) {
  Start-Sleep -Seconds 1

  Write-Output "Waiting for pandoc.css to be downloaded..."

  if (Test-Path ./pandoc.css) {
    Write-Output "pandoc.css downloaded!"
  }
}

Get-ChildItem $cwd -Filter *.md | 
Foreach-Object {
  Write-Output "Processing $_"

  $filename = $_.Name
  $filenameOutput = $filename.Replace(".md", ".pdf")

  pandoc $filename -o $filenameOutput -t html --css pandoc.css
}

Remove-Item ./pandoc.css
