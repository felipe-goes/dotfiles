#!/bin/bash
selected=$(cat "$HOME/.tmux_temp/languages.txt" "$HOME/.tmux_temp/core-utils.txt" | fzf)
read -r -p "Enter Query: " query

existSession=$(tmux ls 2>/dev/null)

if grep -qs "$selected" "$HOME"/.tmux_temp/languages.txt; then
	query=$(echo "$query" | tr ' ' '+')
	echo "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
	if [ "$existSession" == "" ]; then
		bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
	else
		tmux neww bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
	fi
else
	echo "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
	if [ "$existSession" == "" ]; then
		bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
	else
		tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
	fi
fi
