#!/bin/bash

# interface for using querystack
site=$(bat "$HOME"/.tmux/custom/stackapi/sites.txt | gum filter --indicator=">")
query=$(gum input --placeholder "query")

case "$site" in
"stackoverflow")
	tag=$(
		bat "$HOME"/.tmux/custom/stackapi/stackoverflow-tags.csv |
			gum filter --indicator=">" |
			cut -d ',' -f 1 |
			sed 's/[ \t]*$//'
	)
	;;
"superuser")
	tag=$(
		bat "$HOME"/.tmux/custom/stackapi/superuser-tags.csv |
			gum filter --indicator=">" |
			cut -d ',' -f 1 |
			sed 's/[ \t]*$//'
	)
	;;
"askubuntu")
	tag=$(
		bat "$HOME"/.tmux/custom/stackapi/askubuntu-tags.csv |
			gum filter --indicator=">" |
			cut -d ',' -f 1 |
			sed 's/[ \t]*$//'
	)
	;;
"serverfault")
	tag=$(
		bat "$HOME"/.tmux/custom/stackapi/serverfault-tags.csv |
			gum filter --indicator=">" |
			cut -d ',' -f 1 |
			sed 's/[ \t]*$//'
	)
	;;
*)
	echo "Please choose one of the valid sites."
	;;
esac

querystack "$site" "$query" "$tag"
