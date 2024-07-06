#!/bin/bash

set -e

apt update
apt upgrade
apt install python3.12-venv btop yt-dlp
apt install pandoc texlive-latex-base texlive-fonts-recommended texlive-fonts-extra
