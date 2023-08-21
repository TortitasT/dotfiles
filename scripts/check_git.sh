#!/bin/bash

og_path=$(pwd)
git_repos=$(find $HOME -not -path "*/.config/*" -not -path "*/.local/*" -not -path "*/.cache/*" -name ".git" -type d 2>/dev/null | sed 's/\/.git//g')

for repo in $git_repos; do
  echo -e "\033[1m$repo\033[0m"
  git -C $repo status
  echo
done

cd $og_path
