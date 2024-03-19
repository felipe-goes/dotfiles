# Alias

- alias eg         = tldr
- alias ls         = 'exa -lg --icons'
- alias la         = 'exa -lga --icons'
- alias lt         = 'exa --icons --tree --level=2'
- alias vi         = nvim
- alias df         = duf
- alias btop       = bashtop
- alias ds         = 'sudo systemctl start docker'
- alias pyserver   = 'python -m http.server 8080'
- alias fcol       = "tr -s ' ' | cut -d ' ' -f9-"
- alias xargs      = 'xargs -I \_'
- alias commitlint = '/opt/commitlint/node_modules/.bin/commitlint'

# Git

- alias config     = '/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
- alias configlog  = '/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME log --graph --decorate'
- alias configlogf = '/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME log --graph --decorate -p --name-only'
- alias glog       = 'git log --graph --decorate'
- alias glogf      = 'git log --graph --decorate -p --name-only'

- `git ls-tree --name-only HEAD`: mostra os arquivos da pasta atual que estão
sendo versionados pelo Git.

# Folder Shortcuts

- alias dev      = 'cd ~/Public/Dev'
- alias alura    = 'cd \~/Public/Dev/Alura'
- alias projetos = 'cd \~/Public/Dev/Projetos'
- alias windows  = 'cd /mnt/c/Users/ogoes/'
- export WINDOWS = '/mnt/c/Users/ogoes/'

# SGDK

- alias bizhawk = 'sudo sh /opt/bizhawk/EmuHawkMono.sh'

# fzf

**Atalhos úteis**: ctrl-r, ctrl-t, alt-c

- source /usr/share/fzf/completion.bash
- source /usr/share/fzf/key-bindings.bash

# Exports

- export PVSNESLIB_HOME = /mnt/c/pvsneslib/
- export GDK            = /opt/SGDK

- export PATH = "$HOME/.scripts/sgdk:$PATH"
- export PATH = "$HOME/.scripts/pvsneslib:$PATH"
- export PATH =  "$HOME/.scripts/cpp:$PATH"
- export PATH =  "$HOME/.scripts/compressgames:$PATH"
- export PATH =  "$HOME/.scripts/autoconfig:$PATH"
- export PATH =  "$HOME/.scripts/videos:$PATH"
- export PATH =  "$HOME/.tmux:$PATH"

# Info

- `wc -l`: `wc` é usado para contar palavras. com o `-l` ele conta linhas.
