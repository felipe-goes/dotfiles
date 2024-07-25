#!/bin/bash

thread=$1

set -e

key=$(
	ansible-vault view --vault-password-file="$HOME"/password.txt "$HOME"/secure-vault.json |
		jq ".openai.key" | sed s/\"// | sed s/\"//
)
export OPENAI_API_KEY="$key"

# create new window
tmux new-window -n "chatgpt"

# setup for chatgpt configuration file
tmux split-window -h
tmux send-keys -c "chatgpt:1" "cd $HOME/.chatgpt-cli/"
tmux send-keys -c "chatgpt:1" Enter
tmux send-keys -c "chatgpt:1" "nvim config.yaml"
tmux send-keys -c "chatgpt:1" Enter

# setup for notes
tmux split-window -v
tmux send-keys -c "chatgpt:2" "cd $HOME/dev/notes/"
tmux send-keys -c "chatgpt:2" Enter

# setup for the chatgpt interactive mode
tmux select-pane -t 0
tmux send-keys -c "chatgpt:0" "chatgpt --set-thread $thread"
tmux send-keys -c "chatgpt:0" Enter
tmux send-keys -c "chatgpt:0" "chatgpt -i"
tmux send-keys -c "chatgpt:0" Enter
