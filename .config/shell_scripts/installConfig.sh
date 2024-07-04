#!/usr/bin/env bash
set -euo pipefail

# Get packages
echo "Downloading packages..."
sudo pacman -Syu dunst waybar swww hypridle

# Get fonts and icons
echo "Downloading fonts and icons..."
./getfonts.sh && ./geticons.sh

# Get wallpapers

if [[ ! -d "$HOME/Pictures/aesthetic-wallpapers" ]]; then
    echo "Fetching wallpapers..."
    git clone https://github.com/D3Ext/aesthetic-wallpapers.git ~/Pictures/aesthetic-wallpapers
fi 

echo "Configuration installed!"
