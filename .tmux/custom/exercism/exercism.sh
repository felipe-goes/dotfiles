#!/bin/bash

set -e

# set exercism folder (only for go at the moment)
exercism="$HOME"/exercism/go
exercise=$(
	glow -s dark <"$HOME"/.tmux/custom/exercism/template.md |
		gum filter --no-sort --indicator=">"
)

# get the desired lesson
exercise=$(echo "$exercise" | awk '{ print $3 }')

# create new window
tmux new-window -n "exercism"

# setup for README file
tmux split-window -h
tmux send-keys -c "exercism:1" "cd $exercism/$exercise"
tmux send-keys -c "exercism:1" Enter
tmux send-keys -c "exercism:1" "glow -p README.md"
tmux send-keys -c "exercism:1" Enter

# setup for root file of the exercise
tmux select-pane -t 0
tmux send-keys -c "exercism:0" "cd $exercism/$exercise"
tmux send-keys -c "exercism:0" Enter
tmux send-keys -c "exercism:0" "vi $exercise.go"
tmux send-keys -c "exercism:0" Enter
