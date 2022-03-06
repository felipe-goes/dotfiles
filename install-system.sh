#!/bin/bash

# System
pacman -S \
  tldr \
  ripgrep \
  plank \
  ulauncher \
  git \
  fzf \
  flatpak \
  python \
  nodejs \
  npm &&

# Neovim
pacman -S \
  neovim \
  python-pynvim \
  python-black \
  flake8 \
  pyright \
  prettier \
  shfmt \
  shellcheck \
  stylua \
  tolua++ \
  clang \
  lazygit \
  ncdu \
  zk &&

# Terminal customization
pacman -S \
  starship \
  alacritty \
  tmux \
  ueberzug \
  exa &&

# Development
pacman -S \
  cmake \
  docker

