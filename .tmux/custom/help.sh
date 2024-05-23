#!/bin/bash

set -e

# select query option
option=$(bat "$HOME/.tmux/custom/options.txt" | gum filter --indicator=">")

# evaluate which option was selected
if [[ "^$option$" =~ "cheat-sheet" ]]; then
	# show availables languages and core-utils according to txt files
	selected=$(bat "$HOME/.tmux/custom/languages.txt" \
		"$HOME/.tmux/custom/core-utils.txt" | gum filter --indicator=">")

	# build cheat-sheet query based on input according to selected language
	if grep -qs "^$selected$" "$HOME/.tmux/custom/languages.txt"; then
		query=$(gum input --width=50 --placeholder "query")
		query=$(echo "$query" | tr ' ' '+')
		echo "curl cht.sh/$selected/$query"

		tmux neww -n "${selected}-{$query}" bash -c "curl cht.sh/$selected/$query ; read"

	# build cheat-sheet query based on input according to selected core-util
	elif grep -qs "^$selected$" "$HOME/.tmux/custom/core-utils.txt"; then
		query=$(gum input --width=50 --placeholder "query")
		query=$(echo "$query" | tr ' ' '+')
		echo "curl cht.sh/$selected~$query"

		tmux neww -n "${selected}-{$query}" bash -c "curl cht.sh/$selected~$query ; read"
	fi

# build chatgpt query
elif [[ "^$option$" =~ "chatgpt" ]]; then
	tmux neww -n "$option" bash -c "$HOME/.tmux/custom/chatgpt/chatgpt.sh ; read"

# run glow in notes folder
elif [[ "^$option$" =~ "notes" ]]; then
	target=$(eza "$HOME"/dev/notes | gum filter --no-sort --indicator=">")
	tmux neww -n "$option" bash -c "glow -s dark $HOME/dev/notes/$target \
    | gum pager ; read"

# run man in the selected language or core-util according to txt files
elif [[ "^$option$" =~ "man" ]]; then
	target=$(
		bat \
			"$HOME"/.tmux/custom/languages.txt \
			"$HOME"/.tmux/custom/core-utils.txt | gum filter --indicator=">"
	)
	tmux neww -n "$option" bash -c "man $target ; read"

# run tldr in the selected language or core-util according to txt files
elif [[ "^$option$" =~ "eg" ]]; then
	target=$(
		bat \
			"$HOME"/.tmux/custom/languages.txt \
			"$HOME"/.tmux/custom/core-utils.txt |
			gum filter --indicator=">"
	)
	tmux neww -n "$option" bash -c "tldr $target ; read"

# build stack exchange query based on given information
elif [[ "^$option$" =~ "stackexchange" ]]; then
	url=$(
		bash "$HOME"/.tmux/custom/stackapi/stackapi.sh |
			glow -s "$HOME"/.config/glow/stackexchange_theme.json -w 1000 |
			gum choose --height=25 |
			sed 's/[ \t]*$//' |
			rev |
			cut -d ' ' -f 1 |
			rev
	)
	tmux neww -n "stackexchange" bash -c "mdmagic stackexchange $url | glow -p"

# get help for chosen from one of the by-example sites on the list
elif [[ "^$option$" =~ "by-example" ]]; then
	bash -c "$HOME/.tmux/custom/byexample/byexample.sh"

# exercism
elif [[ "^$option$" =~ "exercism" ]]; then
	bash -c "$HOME/.tmux/custom/exercism/exercism.sh"

# handle other cases
else
	echo "Please select one of the listed options"
	read
fi
