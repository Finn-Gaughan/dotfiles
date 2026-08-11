#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# WARNING! this script assumes that the dotfiles repo is already cloned down.

# List of packages, add them here.
PACKAGES=(
  zsh
  fish
  tmux
  neovim
  gh
  alacritty
  fzf
  stow
  starship
  zoxide
  uv
  btop
  genact
  cmatrix
  fastfetch
  bat
  yazi
  tldr
  openvpn
  #google-chrome maybe use flatpack for?
)

# install all packages
sudo dnf install -y "${PACKAGES[@]}"

# run GNU stow
cd ~/dotfiles && stow .
