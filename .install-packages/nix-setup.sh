#!/bin/bash

set -e

# Save current folder and change directory to HOME
currentFolder=$(pwd)
cd "$HOME"

nix-env -u

# System
# missing: npm, make, bashtop
nix-env -if "$HOME/.install-packages/system.nix"

# Neovim
# missing: tolua++, python-pynvim, python-black, python-debugpy, flake8, prettier, composer
nix-env -if "$HOME/.install-packages/neovim.nix"

# Terminal customization
nix-env -if "$HOME/.install-packages/terminal.nix"

# Development
# missing: python-pip
nix-env -if "$HOME/.install-packages/dev.nix"

cd "$currentFolder"
