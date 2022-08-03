#!/bin/bash

sudo pacman -S gnome-shell alacritty gnome-tweaks gnome-control-center xdg-user-dirs gdm gnome-keyring networkmanager bluez bluez-utils ntfs-3g openssh gedit pcmanfm git ttf-jetbrains-mono gpicview mpv openssh

# Enable display manager
sudo systemctl enable gdm.service

# Enable bluetooth
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
sudo systemctl enable --now bluetooth

# Setup yay 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ../

# Install brave browser and auto-cpufreq
yay -S brave-bin auto-cpufreq

# Disable default power options
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

# Enable auto-cpufreq
sudo systemctl start auto-cpufreq
sudo systemctl enable auto-cpufreq

# Check auto-cpufreq status
sudo systemctl status auto-cpufreq


# If flatpak is required for gnome extension manager
# Can use this extension manager to install as well as
# manage existing gnome extensions
# sudo pacman -S flatpak
# flatpak install flathub com.mattjakeman.ExtensionManager


########################################
#### SETUP PYTHON ENVIRONMENT
########################################

mkdir python_env
cd python_env/
python3 -m venv nnfs
source nnfs/bin/activate
python3 -m pip install --upgrade pip
pip install ipykernel
python3 -m ipykernel install --user --name=nnfs
pip install jupyterlab
