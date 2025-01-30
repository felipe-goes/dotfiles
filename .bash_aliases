#!/bin/bash
alias c='clear'
alias s='source $HOME/.bashrc'
alias fd='fdfind'
alias imgcat='wezterm imgcat --position 0,5 --no-move-cursor'
alias al="alias | cut -d ' ' -f 2- | fzf --tmux --reverse"
alias ual='unalias $(alias | cut -d " " -f 2- | fzf --tmux --reverse | cut -d "=" -f -1)'
alias eg=tldr
alias lsc='eza --color=always --long --git --icons=always'
alias ls='eza -1 --color=always --git --icons=always'
alias la='eza -1 --all --color=always --git --icons=always'
alias lt='eza --color=always --long --tree --level=2 --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias v='temp=$(fd --type f --hidden --exclude .git | fzf --tmux 75%,75% --reverse --preview="bat --color=always {}") && test "$temp" != "" && nvim "$temp"'
alias cdf='cd $(fd --type d --hidden --exclude .git | fzf --tmux 75%,75% --reverse)'
alias vi=nvim
alias df=duf
alias ds='sudo systemctl start docker'
alias pyserver='python -m http.server 8080'
alias fcol="tr -s ' ' | cut -d ' ' -f9-"
alias gf='gum filter'
alias commitlint='/opt/commitlint/node_modules/.bin/commitlint'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias pandoc="pandoc -V geometry:margin=2cm -o"
alias update='sudo apt update && sudo apt upgrade'
alias nix-uninstall='nix-env -e'
alias nix-update='nix-env -u'
alias nix-search='nix-env -qaP --description'
alias glowp='glow -p -w 83'
alias spotify='ncspot'
alias rename='rename.ul'
alias grep='grep -i'
alias chrome='google-chrome-stable'

function trim {
	awk '{\$1=\$1;print}'
}
function nix-install {
	nix-env -iA nixpkgs."$1"
}

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

function avrekey {
	old_password_file="$1"
	new_password_file="$2"
	vault_file="$3"

	if [[ "^$old_password_file$" =~ "help" ]]; then
		echo "Re-key already encrypted vault file with a new password file"
		echo ">> avrekey \$old_password_file \$new_password_file \$vault_file"
	else
		ansible-vault rekey --vault-password-file "$old_password_file" --new-vault-password-file "$new_password_file" "$vault_file"
	fi
}

function avread {
	password_file="$1"
	vault_file="$2"

	if [[ "^$password_file$" =~ "help" ]]; then
		echo "View an encrypted file, using a password file to decrypt"
		echo ">> avread \$password_file \$vault_file"

		echo ""
		echo "or"
		echo ""

		echo "View an encrypted file, using a password prompt to decrypt"
		echo ">> avread \$vault_file"
	elif [[ "^$vault_file$" =~ "" ]]; then
		vault_file="$1"
		ansible-vault view --vault-password-file "$vault_file"
	else
		ansible-vault view --vault-password-file "$password_file" "$vault_file"
	fi
}

function avcreate {
	password_file="$1"
	vault_file="$2"

	if [[ "^$password_file$" =~ "help" ]]; then
		echo "Create a new encrypted vault file using a vault key file to encrypt it"
		echo ">> avcreate \$password_file \$vault_file"

		echo ""
		echo "or"
		echo ""

		echo "Create a new encrypted vault file with a prompt for a password"
		echo ">> avcreate \$vault_file"
	elif [[ "^$vault_file$" =~ "" ]]; then
		vault_file="$1"
		ansible-vault create --vault-password-file "$vault_file"
	else
		ansible-vault create --vault-password-file "$password_file" "$vault_file"
	fi

}

function avencrypt {
	password_file="$1"
	vault_file="$2"

	if [[ "^$password_file$" =~ "help" ]]; then
		echo "Encrypt an existing file using a password file"
		echo ">> avencrypt \$password_file \$vault_file"

		echo ""
		echo "or"
		echo ""

		echo "Encrypt an existing file using an optional password file"
		echo ">> avencrypt \$password_file \$vault_file"
	elif [[ "^$vault_file$" =~ "" ]]; then
		vault_file="$1"
		ansible-vault encrypt --vault-password-file "$vault_file"
	else
		ansible-vault encrypt --vault-password-file "$password_file" "$vault_file"
	fi

}

