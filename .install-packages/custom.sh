#!/bin/bash

# ollama
curl -fsSL https://ollama.com/install.sh | sh

# deno
curl -fsSL https://deno.land/install.sh | sh

# starship
curl -sS https://starship.rs/install.sh | sh

# rust - siga as instruções. peguei o método para o WSL
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Add Charm to apt
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update

## glow, gum
sudo apt install glow gum vhs ffmpeg

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# go
# https://go.dev/doc/install

# NodeJS
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 22
# Verify the Node.js version:
node -v     # Should print "v22.17.0".
nvm current # Should print "v22.17.0".
# Verify npm version:
npm -v # Should print "10.9.2".

# wezterm. then you can install with sudo apt install wezterm
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
