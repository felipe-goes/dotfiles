#!/bin/bash

set -e

apt update
apt upgrade
apt install fd-find
apt install python3.12-venv btop yt-dlp
apt install pandoc texlive-latex-base texlive-fonts-recommended texlive-fonts-extra
apt dotnet-sdk-8.0 wmctrl xclip
