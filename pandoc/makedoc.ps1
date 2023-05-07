$cwd = Get-Location

Invoke-WebRequest 'https://raw.githubusercontent.com/tortitast/dotfiles/main/pandoc/pandoc.css' -OutFile '$cwd\pandoc.css'

Get-ChildItem $cwd -Filter *.md | 
Foreach-Object {
  Write-Output "Processing $_"

  $filename = $_.Name
  $filenameOutput = $filename.Replace(".md", ".pdf")

  pandoc $filename -o $filenameOutput -t html --css pandoc.css
}

Remove-Item ./pandoc.css
