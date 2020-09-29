#!/usr/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "You cannot run this script as root"
   exit 1
fi

declare -A filesToSymlink
filesToSymlink=(
  ["init.vim"]="/home/$USER/.config/nvim/init.vim"
  ["i3"]="/home/$USER/.config/i3"
  ["i3blocks"]="/home/$USER/.config/i3blocks"
)

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for file in "${!filesToSymlink[@]}"
do
  echo "key  : $SCRIPT_DIR/$file"
  echo "value: ${filesToSymlink[$file]}"
done
