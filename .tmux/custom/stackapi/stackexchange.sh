#!/bin/bash

# interface for using querystack
site=$(bat "$HOME"/.tmux/custom/stackapi/sites.txt | gum filter --indicator=">")
query=$(gum input --placeholder "query")

case "$site" in
"stackoverflow")
	tag=$(
		column -s, -t < "$HOME"/.tmux/custom/stackapi/stackoverflow-tags.csv |
			gum filter --indicator=">" --no-sort |
			cut -d ' ' -f 1
	)
	;;
"superuser")
	tag=$(
		column -s, -t < "$HOME"/.tmux/custom/stackapi/superuser-tags.csv |
			gum filter --indicator=">" --no-sort |
			cut -d ' ' -f 1
	)
	;;
"askubuntu")
	tag=$(
		column -s, -t < "$HOME"/.tmux/custom/stackapi/askubuntu-tags.csv |
			gum filter --indicator=">" --no-sort |
			cut -d ' ' -f 1
	)
	;;
"serverfault")
	tag=$(
		column -s, -t < "$HOME"/.tmux/custom/stackapi/serverfault-tags.csv |
			gum filter --indicator=">" --no-sort |
			cut -d ' ' -f 1
	)
	;;
*)
	echo "Please choose one of the valid sites."
	;;
esac

querystack "$site" "$query" "$tag"
