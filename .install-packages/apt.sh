#!/bin/bash

set -e

apt update
apt upgrade

# tmux dependencies
apt install libevent-dev ncurses-dev build-essential bison pkg-config

apt install git git-extras zip unzip jq
apt install imagemagick
apt install gcc fd-find duf
apt install luarocks cargo composer php pip
apt install playerctl when taskwarrior btop yt-dlp ffmpeg
apt install pandoc texlive-latex-base texlive-fonts-recommended texlive-fonts-extra
apt install wl-clipboard

# .deb packages
# https://github.com/sharkdp/bat?tab=readme-ov-file#installation

# não sei se vou usar mesmo. a idéia era integrar com o ranger para visuzlizar
# imagens no terminal
# apt install w3m w3m-img
