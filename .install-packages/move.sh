#!/bin/bash

set -e

currentFolder=$(pwd)
cd "$HOME"

mv fzf-git.sh /opt/
mv commitlint /opt/

cd "$currentFolder"
