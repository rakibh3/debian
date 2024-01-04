#!/bin/bash

# Update package lists
sudo apt update

# Install Flatpak and Gnome Software plugin
sudo apt install flatpak gnome-software-plugin-flatpak

# Add Flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub one.ablaze.floorp
