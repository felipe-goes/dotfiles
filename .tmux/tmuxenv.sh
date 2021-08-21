#!/bin/bash

function tmuxenv(){
  local env=$1
  if [[ "$env" == "alura" ]]
  then
    local session="Alura"
    local window="VimMD"
    tmux new-session -d -s $session

    # Vim MarkDown window
    tmux rename-window -t 1 $window
    tmux send-keys -t $window 'cd ~/Public/Dev/Alura' C-m 'clear' C-m
    tmux split-window -v -p 15 -t $sessions:$window
    tmux select-pane -t 2
    tmux split-window -h -t $session:$window

    # Attach to default window
    tmux select-pane -t 1
    tmux a -t $session:$window
  fi
}

if [[ "$1" == "" ]]
then
  echo "Please type session setup name."
else
  tmuxenv $1 $2
fi
