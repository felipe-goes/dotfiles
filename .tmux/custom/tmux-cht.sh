#!/bin/bash
selected=$(cat "$HOME/.tmux/custom/languages.txt" "$HOME/.tmux/custom/core-utils.txt" "$HOME/.tmux/custom/chatgpt.txt" "$HOME/.tmux/custom/notes.txt" | fzf)

existSession=$(tmux ls 2>/dev/null)

if grep -qs "$selected" "$HOME/.tmux/custom/languages.txt"; then
	read -r -p "query: " query
	query=$(echo "$query" | tr ' ' '+')
	echo "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"

	if [ "$existSession" == "" ]; then
		bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
	else
		tmux neww -n "${selected}-${query}" bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
	fi
elif grep -qs "$selected" "$HOME/.tmux/custom/core-utils.txt"; then
	read -r -p "query: " query
	query=$(echo "$query" | tr ' ' '+')
	echo "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"

	if [ "$existSession" == "" ]; then
		bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
	else
		tmux neww -n "${selected}-{$query}" bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
	fi
elif grep -qs "$selected" "$HOME/.tmux/custom/chatgpt.txt"; then
	if [ "$existSession" == "" ]; then
		bash -c "export OPENAI_API_KEY='replace-with-key' && chatgpt --set-model $(chatgpt --list-models | tail -n +2 | fzf | awk '{print $2}') && chatgpt --interactive"
	else
		tmux neww -n "$selected" bash -c "export OPENAI_API_KEY='replace-with-key' && chatgpt --set-model $(chatgpt --list-models | tail -n +2 | fzf | awk '{print $2}') && chatgpt --interactive"
	fi
elif grep -qs "$selected" "$HOME/.tmux/custom/notes.txt"; then
	if [ "$existSession" == "" ]; then
		bash -c "glow $HOME/Public/dev/utils"
	else
		tmux neww -n "$selected" bash -c "glow $HOME/Public/dev/notes"
	fi
else
	tmux neww -n "not found" bash -c "Please select one of the listed options & while [ : ]; do sleep 1; done"
fi
