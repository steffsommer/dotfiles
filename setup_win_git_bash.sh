#!/usr/bin/env bash

log_info() {
  echo "[INFO] $1"
}

error_exit() {
  echo "[ERROR] $1"
  exit 1
}

declare -A filesToSymlink
filesToSymlink=(
  ["nvim"]="/c/Users/$user/AppData/Local/nvim"
  [".ideavimrc"]="/c/Users/$user/.ideavimrc"
  [".tigrc"]="/c/Users/$user/.tigrc"
  [".bashrc"]="/c/Users/$user/.bashrc"
)

if ! [[ $(sfc 2>&1 | tr -d '\0') =~ SCANNOW ]]; then
  error_exit  "This script must be run from a Git bash that was executed as Administrator"
fi

read -p "Enter the username the dotfiles should be set up for: " user

user_home_dir="/c/Users/$user"
if ! [ -d $user_home_dir ]
then
  error_exit "Home directory $user_home_dir for user $user does not exist"
fi

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

log_info "Symlinking dotfiles ..."

for file in "${!filesToSymlink[@]}"
do
  dotfile_linux_path=$dotfiles_dir/$file
  dotfile_windows_path=$(cygpath -w $dotfile_linux_path)

  dotfile_linux_target_path=${filesToSymlink[$file]}
  echo "dotfile_linux_target_path $dotfile_linux_target_path"
  dotfile_windows_target_path=$(cygpath -w $dotfile_linux_target_path)
  echo "dotfile_windows_target_path $dotfile_windows_target_path"

  mkdir -p $(dirname $dotfile_linux_target_path)
  if test -f $dotfile_linux_path
  then
    rm -rf $dotfile_linux_target_path
    cmd "/C mklink $dotfile_windows_target_path $dotfile_windows_path"
  elif test -d $dotfile_linux_path
  then
    rm -rf $dotfile_linux_target_path
    cmd "/C mklink /D $dotfile_windows_target_path $dotfile_windows_path"
  else
    error_exit "$dotfile_linux_path does not exist and therefore cannot be linked. Exiting..."
  fi
done

log_info 'Done'
