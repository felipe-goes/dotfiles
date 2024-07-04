#!/bin/bash

set -e

apt update
apt upgrade
apt install python3.12-venv
apt install git-delta
apt install pandoc texlive-latex-base texlive-fonts-recommended texlive-fonts-extra
