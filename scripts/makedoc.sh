#!/bin/bash

css_url="https://raw.githubusercontent.com/tortitast/dotfiles/master/pandoc/pandoc.css"

wget -o pandoc.tmp.css $css_url

for filename in *.md
do
  filenameOutput="${filename%.*}.pdf"

  pandoc $filename -o $filenameOutput -t html --css pandoc.tmp.css
done

rm pandoc.tmp.css
