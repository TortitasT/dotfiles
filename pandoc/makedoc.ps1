$cwd = Get-Location
$cssUrl = 'https://raw.githubusercontent.com/tortitast/dotfiles/master/pandoc/pandoc.css'

Invoke-WebRequest $cssUrl -OutFile "$cwd\pandoc.tmp.css"

Get-ChildItem $cwd -Filter *.md | 
Foreach-Object {
  Write-Output "Processing $_"

  $filename = $_.Name
  $filenameOutput = $filename.Replace(".md", ".pdf")

  pandoc $filename -o $filenameOutput -t html --css pandoc.tmp.css
}

Remove-Item ./pandoc.tmp.css
