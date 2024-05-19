#!/bin/bash

set -e

# interface for using querystack
site=$(bat "$HOME"/.tmux/custom/stackapi/sites.txt | gum filter --indicator=">")
query=$(gum input --width=50 --placeholder "query")

# take query based on chosen site
case "$site" in
"stackoverflow")
	tag=$(
		column -s, -t <"$HOME"/.tmux/custom/stackapi/stackoverflow-tags.csv |
			gum filter --indicator=">" --no-sort
	)
	;;
"superuser")
	tag=$(
		column -s, -t <"$HOME"/.tmux/custom/stackapi/superuser-tags.csv |
			gum filter --indicator=">" --no-sort
	)
	;;
"askubuntu")
	tag=$(
		column -s, -t <"$HOME"/.tmux/custom/stackapi/askubuntu-tags.csv |
			gum filter --indicator=">" --no-sort
	)
	;;
"serverfault")
	tag=$(
		column -s, -t <"$HOME"/.tmux/custom/stackapi/serverfault-tags.csv |
			gum filter --indicator=">" --no-sort
	)
	;;
*)
	echo "Please choose one of the valid sites."
	;;
esac

test -n "$tag" && tag=$(echo "$tag" | cut -d ' ' -f 1)
querystack "$site" "$query" "$tag"
