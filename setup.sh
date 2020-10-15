#!/usr/bin/env bash

if [[ $EUID -eq 0 ]]; then
   echo "You cannot run this script as root"
   exit 1
fi

declare -A filesToSymlink
filesToSymlink=(
  ["init.vim"]="/home/$USER/.config/nvim/init.vim"
  ["i3"]="/home/$USER/.config/i3"
  ["i3blocks"]="/home/$USER/.config/i3blocks"
  [".zshrc"]="/home/$USER/.zshrc"
  [".Xresources"]="/home/$USER/.Xresources"
)

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# symlink all configured files
for file in "${!filesToSymlink[@]}"
do
  # create directory structures if needed
  mkdir -p $(dirname $file)
  # TODO: actually symlink it
  echo "key  : $SCRIPT_DIR/$file"
  echo "value: ${filesToSymlink[$file]}"
done

if ! command -v yay &> /dev/null
then
    echo "You need to install yay to sync packages"
    exit
fi

# TODO: install packages
