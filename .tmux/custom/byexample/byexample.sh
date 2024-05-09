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

bat "$HOME"/.tmux/custom/byexample/"$language"-sites.txt |
	grep --extended-regexp "^$query," |
	cut -d ',' -f 2
