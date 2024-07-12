# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Exports
key=$(
	ansible-vault view --vault-password-file="$HOME"/password.txt "$HOME"/secure-vault.json |
		jq ".openai.key" | sed s/\"// | sed s/\"//
)
export OPENAI_API_KEY="$key"
export PVSNESLIB_HOME=/mnt/c/pvsneslib/
export GDK=/opt/SGDK
export EDITOR=/home/felipe/.nix-profile/bin/nvim
export GOPATH="$HOME/go"

# WSL
export LIBGL_ALWAYS_SOFTWARE=1
export MESA_GL_VERSION_OVERRIDE=4.5

# FZF
# ctrl-r : histórico de comandos
# ctrl-t : lista os arquivos e diretórios da pasta atual
# alt-c  : lista os diretórios da pasta atual
# ctrl-gf: git Files
# ctrl-gb: git Branches
# ctrl-gt: git Tags
# ctrl-gr: git Remotes
# ctrl-gh: git Hashes
# ctrl-gs: git Stashes
# ctrl-gl: git Reflogs
# ctrl-gw: git Worktrees
# ctrl-ge: git for-Each-ref
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#141618,bg+:#2c2e30
  --color=hl:#33363b,hl+:#4ecbd1,info:#4e8cd1,marker:#e8e847
  --color=prompt:#e84e8d,spinner:#e84e8d,pointer:#e84e8d,header:#87afaf
  --color=border:#262626,label:#e8e847,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker="◆" --pointer=">" --separator="─" --scrollbar="│"'
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--tmux 75%,75% --preview 'bat -n --color=always --line-range :500 {}'"
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS="--tmux 50%,75%"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--tmux 75%,75% --preview 'eza --tree --color=always {} | head -200'"

# difftastic
export DFT_COLOR=always
export DFT_DISPLAY=side-by-side-show-both
export DFT_TAB_WIDTH=2

# Use fd (https:://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}

export PATH="$HOME/.scripts/sgdk:$PATH"
export PATH="$HOME/.scripts/pvsneslib:$PATH"
export PATH="$HOME/.scripts/cpp:$PATH"
export PATH="$HOME/.scripts/compressgames:$PATH"
export PATH="$HOME/.scripts/autoconfig:$PATH"
export PATH="$HOME/.scripts/videos:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/opt/exercism:$PATH"

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

source /opt/fzf-git.sh/fzf-git.sh
eval "$(tmuxifier init -)"
eval "$(zoxide init --cmd cd bash)"
eval "$(starship init bash)"
eval "$(fzf --bash)"
. <(chatgpt --set-completions bash)
