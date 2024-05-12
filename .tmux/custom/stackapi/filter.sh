#!/bin/bash

# - show querystack output using glow
# - pick a result using gum
# - extract web link
url=$(
	glow -s "$HOME"/.config/glow/stackexchange_theme.json -w 1000 |
		gum choose --height=40 |
		sed 's/[ \t]*$//' |
		rev |
		cut -d ' ' -f 1 |
		rev
)

mdmagic "$url" | glow -p
