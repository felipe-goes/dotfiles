#!/bin/bash
#  _
# | |_ _ __ ___  _   ___  __
# | __| '_ ` _ \| | | \ \/ /
# | |_| | | | | | |_| |>  <
#  \__|_| |_| |_|\__,_/_/\_\
#

function tmuxenv(){
  local env=$1
  local validSessions=("alura")

  # Check which session create
  if [[ "${env^^}" == "${validSessions[0]^^}" ]]
  then
    local session="Alura"
    local window="VimMD"

    local activeSession=$(tmux list-sessions | grep -i alura | sed s/:.*//)

    # Check if session already exist before creating one
    if [[ "${activeSession^^}" != "${session^^}" ]]
    then
      tmux new-session -d -s $session

      # Vim MarkDown window
      tmux rename-window -t 1 $window
      tmux send-keys -t $window 'cd ~/Public/Dev/Alura' C-m 'clear' C-m
      tmux split-window -v -p 25 -t $sessions:$window
      tmux select-pane -t 2
      tmux split-window -h -t $session:$window
    fi

    # Attach to default window
    tmux select-pane -t 1
    tmux a -t $session:$window
  else
    echo "Please choose one of the following valid session names:"
    echo "${validSessions[@]}" | tr " " "\n"
  fi
}

if [[ "$1" == "" ]]
then
  echo "Please type session setup name."
else
  tmuxenv $1 $2
fi
