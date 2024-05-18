#!/bin/bash

# select query option
option=$(bat "$HOME/.tmux/custom/options.txt" | gum filter --indicator=">")

# evaluate which option was selected
if [[ "^$option$" =~ "cheat-sheet" ]]; then
	# show availables languages and core-utils according to txt files
	selected=$(bat "$HOME/.tmux/custom/languages.txt" \
		"$HOME/.tmux/custom/core-utils.txt" | gum filter --indicator=">")

	# build cheat-sheet query based on input according to selected language
	if grep -qs "^$selected$" "$HOME/.tmux/custom/languages.txt"; then
		query=$(gum input --placeholder "query")
		query=$(echo "$query" | tr ' ' '+')
		echo "curl cht.sh/$selected/$query ; read"

		tmux neww -n "${selected}-{$query}" bash -c "curl cht.sh/$selected/$query ; read"

	# build cheat-sheet query based on input according to selected core-util
	elif grep -qs "^$selected$" "$HOME/.tmux/custom/core-utils.txt"; then
		query=$(gum input --placeholder "query")
		query=$(echo "$query" | tr ' ' '+')
		echo "curl cht.sh/$selected~$query ; read"

		tmux neww -n "${selected}-{$query}" bash -c "curl cht.sh/$selected~$query ; read"
	fi

# build chatgpt query
elif [[ "^$option$" =~ "chatgpt" ]]; then
	tmux neww -n "$option" bash -c "$HOME/.tmux/custom/chatgpt/chatgpt.sh ; read"

# run glow in notes folder
elif [[ "^$option$" =~ "notes" ]]; then
	tmux neww -n "$option" bash -c "glow -s dark \
    $HOME/dev/notes/$(eza "$HOME"/dev/notes | gum choose --height=40) \
    | gum pager ; read"

# run man in the selected language or core-util according to txt files
elif [[ "^$option$" =~ "man" ]]; then
	tmux neww -n "$option" bash -c "man $(bat \
		"$HOME"/.tmux/custom/languages.txt \
		"$HOME"/.tmux/custom/core-utils.txt | gum filter --indicator=">") ; read"

# run tldr in the selected language or core-util according to txt files
elif [[ "^$option$" =~ "eg" ]]; then
	tmux neww -n "$option" bash -c "tldr $(bat \
		"$HOME"/.tmux/custom/languages.txt \
		"$HOME"/.tmux/custom/core-utils.txt | gum filter --indicator=">") ; read"

# build stack exchange query based on given information
elif [[ "^$option$" =~ "stackexchange" ]]; then
	bash -c "bash $HOME/.tmux/custom/stackapi/stackapi.sh \
    | bash $HOME/.tmux/custom/stackapi/filter.sh"

# handle other cases
elif [[ "^$option$" =~ "by-example" ]]; then
	bash -c "$HOME/.tmux/custom/byexample/byexample.sh"

# handle other cases
else
	tmux neww -n "not-found" bash -c "echo 'Please select one of the listed options' ; read"
fi
