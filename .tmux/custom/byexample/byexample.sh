#!/bin/bash

language=$(bat "$HOME"/.tmux/custom/byexample/languages.txt | gum choose)

query=$(
	bat "$HOME"/.tmux/custom/byexample/"$language".md |
		glow -s "$HOME"/.config/glow/stackexchange_theme.json -w 1000 |
		gum filter --no-sort --indicator=">" |
		sed 's/^[ \t]*//' |
		cut -d ' ' -f 2- |
		sed 's/[ \t]*$//'
)

site=$(
	bat "$HOME"/.tmux/custom/byexample/"$language"-sites.txt |
		grep --extended-regexp "^$query," |
		cut -d ',' -f 2
)

if [[ "^$language$" =~ "cpp" ]]; then
	tmux neww -n "byexample" bash -c "mdmagic ${language}byexample $site | glow -p"
else
	tmux neww -n "byexample" bash -c "echo $site ; read"
fi
