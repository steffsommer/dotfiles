#!/usr/bin/env bash

if [[ $EUID -eq 0 ]]; then
  echo "[ERR] You cannot run this script as root"
  exit 1
fi

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

declare -A filesToSymlink
filesToSymlink=(
  ["nvim"]="/home/$USER/.config/nvim"
  [".bashrc"]="/home/$USER/.bashrc"
  [".zshrc"]="/home/$USER/.zshrc"
  [".gitconfig"]="/home/$USER/.gitconfig"
  ["tmux.conf"]="/home/$USER/.config/tmux/tmux.conf"
  [".tigrc"]="/home/$USER/.tigrc"
  ["zellij_config.kdl"]="/home/$USER/.config/zellij/config.kdl"
)

echo "[INFO] Symlinking dotfiles ..."
for file in "${!filesToSymlink[@]}"
do
  echo "  -> linking $file"
  mkdir -p $(dirname ${filesToSymlink[$file]})
  origin_file_path=$dotfiles_dir/$file
  link_target_path=${filesToSymlink[$file]}
  ln -sf $origin_file_path $link_target_path
done

echo "[INFO] Done."
