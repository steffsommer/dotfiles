#!/usr/bin/env bash
# Caveats: Currently only works for directories, because mklink /D is used

if [[ $(sfc 2>&1 | tr -d '\0') =~ SCANNOW ]]; then
	IS_ADMIN=true
else
	IS_ADMIN=false
fi
if [[ $IS_ADMIN = false ]]; then
	echo "This script must be run from a Git bash that was executed as Administrator"
	exit 1
fi

read -p "Enter the username the dotfiles should be set up for: " DOTFILES_USER
echo $DOTFILES_USER

## Links ##
# Links must be the windows absolute paths, because mklink will be invoked using cmd
declare -A filesToSymlink
filesToSymlink=(
  ["nvim"]="C:\\Users\\$DOTFILES_USER\\AppData\\Local\\nvim"
)

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
dotfiles_dir_win_path=$(cygpath $dotfiles_dir)

# symlink all configured files
echo "[INFO] Symlinking dotfiles ..."
for file in "${!filesToSymlink[@]}"
do
  origin_file_path=$dotfiles_dir_win_path/$file
  link_target_path=${filesToSymlink[$file]}
  echo "Linking $origin_file_path to $link_target_path"

  git_bash_path=$(cygpath ${filesToSymlink[$file]})
  mkdir -p $(dirname git_bash_path)

  cmd "/C mklink /D $link_target_path $origin_file_path"
done

echo "[INFO] Done."
