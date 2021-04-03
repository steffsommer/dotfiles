#!/usr/bin/env bash

if [[ $EUID -eq 0 ]]; then
  echo "[ERR] You cannot run this script as root"
  exit 1
fi

declare -A filesToSymlink
filesToSymlink=(
  ["init.vim"]="/home/$USER/.config/nvim/init.vim"
  ["i3"]="/home/$USER/.config/i3"
  ["i3blocks"]="/home/$USER/.config/i3blocks"
  [".zshrc"]="/home/$USER/.zshrc"
  [".Xresources"]="/home/$USER/.Xresources"
  ["coc-settings.json"]="/home/$USER/.config/nvim/coc-settings.json"
  ["wallpapers"]="/home/$USER/Pictures/wallpapers"
  [".gitconfig"]="/home/$USER/.gitconfig"
  [".tigrc"]="/home/$USER/.tigrc"
  ["alacritty.yml"]="/home/$USER/.config/alacritty/alacritty.yml"
  ["scripts/setupMonitors.sh"]="/usr/bin/setupMonitors"
)

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# symlink all configured files
echo "[INFO] Symlinking dotfiles ..."
for file in "${!filesToSymlink[@]}"
do
  echo "  -> linking $file"
  mkdir -p $(dirname $file)
  origin_file_path=$dotfiles_dir/$file
  link_target_path=${filesToSymlink[$file]}
  sudo ln -sf $origin_file_path $link_target_path
done

# check if the OS is Arch Linux
os_raw="$(cat /etc/os-release | grep PRETTY_NAME)"
pat='"(.*)"'
[[ $os_raw =~ $pat ]];
if [[ ${BASH_REMATCH[1]} != "Arch Linux" ]]
then
  echo "[INFO] Package synchronisation is only supported for Arch Linux. Exiting."
  exit 1
fi

if ! command -v yay &> /dev/null
then
  echo "[ERR] You need to install yay to sync packages"
  exit
fi

echo "[INFO] Upgrading System ..."
yay -Syu

echo "[INFO] Installing packages ..."
yay -S - < packages.txt

echo "[INFO] Done"
