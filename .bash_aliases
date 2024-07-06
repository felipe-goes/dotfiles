#!/bin/bash
alias c='clear'
alias s='source $HOME/.bashrc'
alias al="alias | cut -d ' ' -f 2- | fzf-tmux -p --reverse"
alias ual='unalias $(alias | cut -d " " -f 2- | fzf-tmux -p --reverse | cut -d "=" -f -1)'
alias eg=tldr
alias lsc='eza --color=always --long --git --icons=always'
alias ls='eza -1 --color=always --git --icons=always'
alias la='eza -1 --all --color=always --git --icons=always'
alias lt='eza --color=always --long --tree --level=2 --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias v='temp=$(fd --type f --hidden --exclude .git | fzf-tmux -p 75%,75% --reverse --preview="bat --color=always {}") && test "$temp" != "" && nvim "$temp"'
alias cdf='cd $(fd --type d --hidden --exclude .git | fzf-tmux -p 75%,75% --reverse)'
alias vi=nvim
alias df=duf
alias ds='sudo systemctl start docker'
alias pyserver='python -m http.server 8080'
alias fcol="tr -s ' ' | cut -d ' ' -f9-"
alias gf='gum filter'
alias commitlint='/opt/commitlint/node_modules/.bin/commitlint'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias trim="awk '{\$1=\$1;print}'"

function take {
	mkdir -p "$1"
	cd "$1" || return
}

function note {
	{
		echo "date: $(date)"
		echo "$@"
		echo ""
	} >>"$HOME"/drafts.txt
}