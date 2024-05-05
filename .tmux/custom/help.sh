#!/bin/bash
option=$(bat "$HOME/.tmux/custom/options.txt" | gum filter)

existSession=$(tmux ls 2>/dev/null)

if [[ "^$option$" =~ "cheat-sheet" ]]; then
	selected=$(bat "$HOME/.tmux/custom/languages.txt" "$HOME/.tmux/custom/core-utils.txt" | gum filter)

	if grep -qs "^$selected$" "$HOME/.tmux/custom/languages.txt"; then
		read -r -p "query: " query
		query=$(echo "$query" | tr ' ' '+')
		echo "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"

		if [ "$existSession" == "" ]; then
			bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
		else
			tmux neww -n "${selected}-{$query}" bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
		fi
	elif grep -qs "^$selected$" "$HOME/.tmux/custom/core-utils.txt"; then
		read -r -p "query: " query
		query=$(echo "$query" | tr ' ' '+')
		echo "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"

		if [ "$existSession" == "" ]; then
			bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
		else
			tmux neww -n "${selected}-{$query}" bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
		fi
	fi
elif [[ "^$option$" =~ "chatgpt" ]]; then
	if [ "$existSession" == "" ]; then
		bash -c "export OPENAI_API_KEY='replace-with-key' && chatgpt --set-model $(chatgpt --list-models | tail -n +2 | fzf | awk '{print $2}') && chatgpt --interactive"
	else
		tmux neww -n "$option" bash -c "export OPENAI_API_KEY='replace-with-key' && chatgpt --set-model $(chatgpt --list-models | tail -n +2 | fzf | awk '{print $2}') && chatgpt --interactive"
	fi
elif [[ "^$option$" =~ "notes" ]]; then
	if [ "$existSession" == "" ]; then
		bash -c "glow -w 80 $HOME/Public/dev/utils"
	else
		tmux neww -n "$option" bash -c "glow -w 80 $HOME/Public/dev/notes"
	fi
elif [[ "^$option$" =~ "man" ]]; then
	if [ "$existSession" == "" ]; then
		bat "$HOME/.tmux/custom/languages.txt" "$HOME/.tmux/custom/core-utils.txt" | gum filter
	else
		tmux neww -n "$option" bash -c "man $(bat "$HOME"/.tmux/custom/languages.txt "$HOME"/.tmux/custom/core-utils.txt | gum filter) & while [ : ]; do sleep 1; done"
	fi
elif [[ "^$option$" =~ "eg" ]]; then
	if [ "$existSession" == "" ]; then
		bat "$HOME/.tmux/custom/languages.txt" "$HOME/.tmux/custom/core-utils.txt" | gum filter
	else
		tmux neww -n "$option" bash -c "tldr $(bat "$HOME"/.tmux/custom/languages.txt "$HOME"/.tmux/custom/core-utils.txt | gum filter) & while [ : ]; do sleep 1; done"
	fi
else
	tmux neww -n "not-found" bash -c "echo 'Please select one of the listed options' & while [ : ]; do sleep 1; done"
fi
