#!/bin/bash

# - show querystack output using glow
# - pick a result using gum
# - extract web link into url variable
url=$(
	glow -s "$HOME"/.config/glow/stackexchange_theme.json -w 1000 |
		gum choose --height=25 |
		sed 's/[ \t]*$//' |
		rev |
		cut -d ' ' -f 1 |
		rev
)

tmux neww -n "stackexchange" bash -c "mdmagic stackexchange $url | glow -p"
