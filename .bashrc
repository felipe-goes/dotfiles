#!/bin/bash
# ~/.bashrc
#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|
#

[[ $- != *i* ]] && return

colors() {
  local fgc bgc vals seq0

  printf "Color escapes are %s\n" "\e[${value};...;${value}m"
  printf "Values 30..37 are \e[33mforeground colors\e[m\n"
  printf "Values 40..47 are \e[43mbackground colors\e[m\n"
  printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

  # foreground colors
  for fgc in {30..37}; do
    # background colors
    for bgc in {40..47}; do
      fgc=${fgc#37} # white
      bgc=${bgc#40} # black

      vals="${fgc:+$fgc;}${bgc}"
      vals=${vals%%;}

      seq0="${vals:+\e[${vals}m}"
      printf "  %-9s" "${seq0:-(default)}"
      printf " %sTEXT\e[m" "${seq0}"
      printf " \e[%s1mBOLD\e[m" "${vals:+${vals+$vals;}}"
    done
    echo
    echo
  done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
xterm* | rxvt* | Eterm* | aterm | kterm | gnome* | interix | konsole*)
  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
  ;;
screen*)
  PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
  ;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?} # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs} ]] &&
  type -P dircolors >/dev/null &&
  match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color}; then
  # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
  if type -P dircolors >/dev/null; then
    if [[ -f ~/.dir_colors ]]; then
      eval "$(dircolors -b ~/.dir_colors)"
    elif [[ -f /etc/DIR_COLORS ]]; then
      eval "$(dircolors -b /etc/DIR_COLORS)"
    fi
  fi

  if [[ ${EUID} == 0 ]]; then
    PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
  else
    PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
  fi

  alias ls='ls -l --color=auto' #adiconei o -l
  alias la='ls -la --color=auto'
  alias grep='grep --colour=auto'
  alias egrep='egrep --colour=auto'
  alias fgrep='fgrep --colour=auto'
else
  if [[ ${EUID} == 0 ]]; then
    # show root@ when we don't have colors
    PS1='\u@\h \W \$ '
  else
    PS1='\u@\h \w \$ '
  fi
fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"     # confirm before overwriting something
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root >/dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex() {
  if [ -f "$1" ]; then
    case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Adicionado ao bashrc
## Alias
alias eg=tldr
alias lsc='eza --color=always --long --git --icons=always'
alias ls='eza --color=always --long --git --icons=always --no-time --no-user --no-permissions'
alias la='eza --color=always --long --all --git --icons=always --no-time --no-user --no-permissions'
alias lt='eza --color=always --long --tree --level=2 --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias vi=nvim
alias df=duf
alias btop=bashtop
alias ds='sudo systemctl start docker'
alias pyserver='python -m http.server 8080'
alias fcol="tr -s ' ' | cut -d ' ' -f9-"
alias xargs='xargs -I _'

#Git
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias configlog='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME log --graph --decorate'
alias configlogf='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME log --graph --decorate -p --name-only'
alias glog='git log --graph --decorate'
alias glogf='git log --graph --decorate -p --name-only'
alias commitlint='/opt/commitlint/node_modules/.bin/commitlint'

# Folder Shortcuts
alias dev='cd ~/Public/Dev'
alias alura='cd ~/Public/Dev/Alura'
alias projetos='cd ~/Public/Dev/Projetos'
alias windows='cd /mnt/c/Users/ogoes/'
export WINDOWS='/mnt/c/Users/ogoes/'

# SGDK
alias bizhawk='sudo sh /opt/bizhawk/EmuHawkMono.sh'

# Exports
export PVSNESLIB_HOME=/mnt/c/pvsneslib/
export GDK=/opt/SGDK
# Use fd instead of find
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export BAT_THEME=tokyonight_night

export PATH="$HOME/.scripts/sgdk:$PATH"
export PATH="$HOME/.scripts/pvsneslib:$PATH"
export PATH="$HOME/.scripts/cpp:$PATH"
export PATH="$HOME/.scripts/compressgames:$PATH"
export PATH="$HOME/.scripts/autoconfig:$PATH"
export PATH="$HOME/.scripts/videos:$PATH"
export PATH="$HOME/.tmux:$PATH"

# Para o fzf
# Atalhos úteis:
# ctrl-r : histórico de comandos
# ctrl-t : lista os arquivos e diretórios da pasta atual
# alt-c  : lista os diretórios da pasta atual
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function is the base path to start traversal
# - See the source code (completion.*) for the details
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --exclude .git . "$1"
}

source /opt/fzf-git.sh/fzf-git.sh

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

eval "$(starship init bash)"
eval "$(thefuck --alias)"
