#!/bin/bash

# - show querystack output using glow
# - pick a result using gum
# - extract web link
glow -s dark -w 1000 |
	gum choose --height=50 |
	sed 's/[ \t]*$//' |
	rev |
	cut -d ' ' -f 1 |
	rev
