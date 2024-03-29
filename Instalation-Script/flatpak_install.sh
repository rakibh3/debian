#!/bin/bash

# Update package lists
sudo nala update

sudo nala upgrade -y

sudo nala install gnome-tweaks -y

sudo nala install gnome-shell-extensions -y

# Install Flatpak and Gnome Software plugin
sudo nala install flatpak gnome-software-plugin-flatpak

# Add Flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo -y

flatpak install flathub org.mozilla.firefox -y

sudo cp -r $HOME/flathub/gitconfig/.* $HOME/