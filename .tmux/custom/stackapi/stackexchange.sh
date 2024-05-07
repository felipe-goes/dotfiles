#!/bin/bash

# interface for using querystack
site=$(bat "$HOME"/.tmux/custom/sites.txt | gum filter)
query=$(gum input --placeholder "query")
tag=$(bat "$HOME"/.tmux/custom/languages.txt "$HOME"/.tmux/custom/core-utils.txt | gum filter)

querystack "$site" "$query" "$tag"
