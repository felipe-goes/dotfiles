#!/bin/bash

set -e

currentFolder=$(pwd)
cd "$HOME"

# tmux tpm
git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm

# tmuxifier
git clone git@github.com:jimeh/tmuxifier.git ~/.tmuxifier

# charm softwares
go install github.com/charmbracelet/mods@latest
go install github.com/charmbracelet/soft-serve/cmd/soft@latest

# fzf shortcuts
# junegunn/fzf-git.sh
# clona na pasta /opt antes de dar um source no .bashrc
git clone git@github.com:junegunn/fzf-git.sh.git

# querystack
mkdir -p ~/dev/go/
cd ~/dev/go/
git clone git@github.com:felipe-goes/querystack.git
cd querystack && go build . && mv querystack "$HOME/go/bin/"

# mdmagic
cd ~/dev/go/
git clone git@github.com:felipe-goes/mdmagic.git
cd mdmagic && go build . && mv mdmagic "$HOME/go/bin/"

# conventional-changelog/commitlint
# clona na pasta /opt
# dentro da pasta /opt/commitlint roda: yarn && yarn run build
cd "$HOME"
git clone git@github.com:conventional-changelog/commitlint.git
# procura alguma configuração padrão no site para adicionar ao repo e altera o
# arquivo `commitlint.config.js` de `exports default` -> `module.exports = `

cd "$currentFolder"
