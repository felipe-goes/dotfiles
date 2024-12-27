#!/bin/bash

set -e

apt update
apt upgrade
apt install imagemagick
apt install gcc fd-find
apt install luarocks cargo composer php pip
apt install playerctl when taskwarrior btop yt-dlp
apt install pandoc texlive-latex-base texlive-fonts-recommended texlive-fonts-extra
