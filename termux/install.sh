#/bin/bash

linkFile() {
  if [ -f $2 ]; then
    rm -rf $2
  fi

  ln -sf $PWD/$1 $2
}

linkDirectory() {
  if [ -d $2 ]; then
    rm -rf $2
  fi

  ln -sf $PWD/$1 $2
}

copyFilesInDirectory() {
  if [ -d $2 ]; then
    rm -rf $2
  fi

  mkdir $2

  for FILE in $PWD/$1/*; do
    FILENAME=${FILE##*/};
    rm -f "$2/$FILENAME"; 
    cp -f "$FILE" "$2/$FILENAME"; 
  done
}

copyFilesInDirectory ".shortcuts" "$HOME/.shortcuts"
