#!/bin/bash
option=$(bat "$HOME/.tmux/custom/options.txt" | gum filter)

if [[ "^$option$" =~ "cheat-sheet" ]]; then
	selected=$(bat "$HOME/.tmux/custom/languages.txt" "$HOME/.tmux/custom/core-utils.txt" | gum filter)

	if grep -qs "^$selected$" "$HOME/.tmux/custom/languages.txt"; then
		query=$(gum input --placeholder "query")
		query=$(echo "$query" | tr ' ' '+')
		echo "curl cht.sh/$selected/$query ; read"

		tmux neww -n "${selected}-{$query}" bash -c "curl cht.sh/$selected/$query ; read"
	elif grep -qs "^$selected$" "$HOME/.tmux/custom/core-utils.txt"; then
		query=$(gum input --placeholder "query")
		query=$(echo "$query" | tr ' ' '+')
		echo "curl cht.sh/$selected~$query ; read"

		tmux neww -n "${selected}-{$query}" bash -c "curl cht.sh/$selected~$query ; read"
	fi
elif [[ "^$option$" =~ "chatgpt" ]]; then
	tmux neww -n "$option" bash -c "export OPENAI_API_KEY='replace-with-key' && $HOME/go/bin/mods -M -f ; read"
elif [[ "^$option$" =~ "notes" ]]; then
  tmux neww -n "$option" bash -c "glow -s dark $HOME/dev/notes/$(ls "$HOME"/dev/notes | gum choose --height=50) | gum pager ; read"
elif [[ "^$option$" =~ "man" ]]; then
	tmux neww -n "$option" bash -c "man $(bat "$HOME"/.tmux/custom/languages.txt "$HOME"/.tmux/custom/core-utils.txt | gum filter) ; read"
elif [[ "^$option$" =~ "eg" ]]; then
	tmux neww -n "$option" bash -c "tldr $(bat "$HOME"/.tmux/custom/languages.txt "$HOME"/.tmux/custom/core-utils.txt | gum filter) ; read"
elif [[ "^$option$" =~ "stackexchange" ]]; then
	tmux neww -n "$option" bash -c "bash $HOME/.tmux/custom/stackapi/stackexchange.sh | bash $HOME/.tmux/custom/stackapi/filter.sh ; read"
else
	tmux neww -n "not-found" bash -c "echo 'Please select one of the listed options' ; read"
fi
