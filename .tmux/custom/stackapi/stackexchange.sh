#!/bin/bash

# interface for using querystack
site=$(bat "$HOME"/.tmux/custom/stackapi/sites.txt | gum filter --indicator=">")
query=$(gum input --placeholder "query")
tag=$(bat "$HOME"/.tmux/custom/languages.txt "$HOME"/.tmux/custom/core-utils.txt | gum filter)

querystack "$site" "$query" "$tag"
