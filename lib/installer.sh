#!/bin/bash

print() {
  status=$1
  message=$2

  case $status in
    "info")
      echo -e "\033[0;34m[info] =>\033[0m $message"
      ;;
    "success")
      echo -e "\033[0;32m[success] =>\033[0m $message"
      ;;
    "warning")
      echo -e "\033[0;33m[warning] =>\033[0m $message"
      ;;
    "error")
      echo -e "\033[0;31m[error] =>\033[0m $message"
      ;;
    *)
      echo -e "\033[0;34m[info] =>\033[0m $1"
      ;;
  esac
}

linkFile() {
  if [ -f $2 ]; then
    rm -rf $2
    print "info" "Removing $2"
  fi

  if [ ! -f $PWD/$1 ]; then
    print "error" "File $PWD/$1 does not exist, skipping..."
    return 1
  fi

  ln -sf $PWD/$1 $2
  print "success" "Linking $2"
}

linkDirectory() {
  if [ -d $2 ]; then
    rm -rf $2
    print "info" "Removing $2"
  fi

  if [ ! -d $PWD/$1 ]; then
    print "error" "Directory $PWD/$1 does not exist, skipping..."
    return 1
  fi

  ln -sf $PWD/$1 $2
  print "success" "Linking $2"
}

ensureDirectory() {
  if [ ! -d $1 ]; then
    print "info" "Creating $1"
    mkdir -p $1
  fi
}

ensureDirectories() {
  for directory in "$@"; do
    ensureDirectory "$directory"
  done
}

prompt () {
  print "warning" "$1 [y/N] "
  read -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    return 1
  fi

  return 0
}

archInstallPackage () {
  is_on_repos=$(pacman -Ss $1 | grep $1 | wc -l)

  echo "$1;" >> $HOME/.install.log

  if [ $is_on_repos -eq 0 ]; then
    print "info" "Installing $1 from AUR" 
    yay -S --noconfirm $1
    return 
  fi

  print "info" "Installing $1 from repos"
  sudo pacman -S --noconfirm $1
}

isCommandInstalled() {
  if command -v $1 &> /dev/null; then
    return
  fi

  false
}

archIsPackageInstalled() {
  pacman -Qi $1 &>/dev/null
  found=$?

  if [ $found = 1 ]; then
    isCommandInstalled "$1"
  fi

  return
}
