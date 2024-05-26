#!/bin/bash

set -e

# set exercism folder (only for go at the moment)
exercism="$HOME"/exercism/go
exerciseDir=$(
	glow -s dark <"$HOME"/.tmux/custom/exercism/template.md |
		gum filter --no-sort --indicator=">"
)

# get the desired lesson
exerciseDir=$(
	echo "$exerciseDir" |
		rev |
		sed 's/^ *//' |
		cut -d ' ' -f 1 |
		rev
)
exercise=${exerciseDir//-/_}

# create new window
tmux new-window -n "exercism"

# setup for README file
tmux split-window -h
tmux send-keys -c "exercism:1" "cd $exercism/$exerciseDir"
tmux send-keys -c "exercism:1" Enter
tmux send-keys -c "exercism:1" "glow -p README.md"
tmux send-keys -c "exercism:1" Enter

# setup for root file of the exercise
tmux select-pane -t 0
tmux send-keys -c "exercism:0" "cd $exercism/$exerciseDir"
tmux send-keys -c "exercism:0" Enter
tmux send-keys -c "exercism:0" "vi $exercise.go"
tmux send-keys -c "exercism:0" Enter
