#!/usr/bin/env zsh

# Prevent running as root
if [[ $EUID -eq 0 ]]; then
  echo "[ERR] You cannot run this script as root"
  exit 1
fi

dotfiles_dir=$(cd "$(dirname "$0")" && pwd)

typeset -A filesToSymlink

filesToSymlink=(
  nvim               "$HOME/.config/nvim"
  .zshrc             "$HOME/.zshrc"
  .tigrc             "$HOME/.tigrc"
  zellij_config.kdl  "$HOME/.config/zellij/config.kdl"
  ghostty            "$HOME/.config/ghostty"
  .ideavimrc         "$HOME/.ideavimrc"
  aerospace          "$HOME/.config/aerospace"
)

echo "[INFO] Symlinking dotfiles ..."

for file in "${(@k)filesToSymlink}"; do
  target_path="${filesToSymlink[$file]}"
  origin_path="$dotfiles_dir/$file"
  echo "  -> linking $file"
  mkdir -p "$(dirname "$target_path")"
  ln -sf "$origin_path" "$target_path"
done

echo "[INFO] Done."

