#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# WARNING! this script assumes that the dotfiles repo is already cloned down.

# List of packages, add them here.
PACKAGES=(
  zsh
  tmux
  neovim
  git
  gh
  alacritty
  #sway
  #google-chrome maybe use flatpack for?
  #yazi
)

# install all packages
sudo dnf install -y "${PACKAGES[@]}"

# run GNU stow
cd ~/dotfiles && stow .
