#!/bin/bash
# Example ./convert.sh *.jpeg

FORMATS=(png jpg jpeg webp avif)
FILES=$@

report() {
  file=$1

  image_size=$(du -h $file | awk '{print $1}')
  echo "Image size: $image_size"

  image_dimensions=$(identify -format "%wx%h" $file)
  echo "Image dimensions: $image_dimensions"

  echo
}

reduce() {
  file=$1

  echo "Reduce $file size?"
  read -p "y/n: " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Reducing $file size"
    convert $file -resize 50% $file

    report $file
  fi
}

selected_format=$(printf "%s\n" "${FORMATS[@]}" | fzf)

for file in $FILES; do
  file_base="${file%.*}."
  new_file=$file_base$selected_format

  echo "Converting $file to $new_file"
  echo

  convert $file $new_file
  report $new_file
  reduce $new_file

  echo
done

