#!/bin/bash
#  _
# | |_ _ __ ___  _   ___  __
# | __| '_ ` _ \| | | \ \/ /
# | |_| | | | | | |_| |>  <
#  \__|_| |_| |_|\__,_/_/\_\
#

function tmuxenv() {
    local env=$1
    local validSessions=("alura" "mtg" "fem")
    declare local existingSession

    # Check which session create
    if [[ ${env^^} == "${validSessions[0]^^}" ]]; then
        local session="Alura"
        declare local windows=("Markdown" "codigo")

        existingSession=$(tmux list-sessions | grep -i alura | sed s/:.*//)

        # Check if session already exist before creating one
        if [[ ${existingSession^^} != "${session^^}" ]]; then
            tmux new-session -d -s $session

            # Vim MarkDown window
            tmux rename-window -t 1 "${windows[0]}"
            tmux send-keys -t "${windows[0]}" "cd ~/Public/Dev/Alura" C-m "clear" C-m

            # Vim codigo window
            tmux new-window -t 2
            tmux rename-window -t 2 "${windows[1]}"
            tmux send-keys -t "${windows[1]}" "cd ~/Public/Dev/Alura" C-m "clear" C-m

            # Vim bash window
            tmux new-window -t 3
        fi

        # Attach to default window
        tmux a -t $session:"${windows[0]}"
    elif [[ ${env^^} == "${validSessions[1]^^}" ]]; then
        local session="MTG"
        declare -a local windows=("script" "markdown" "test")

        existingSession=$(tmux list-sessions | grep -i mtg | sed s/:.*//)

        # Check if session already exist before creating one
        if [[ ${existingSession^^} != "${session^^}" ]]; then
            tmux new-session -d -s $session

            # Vim Script Window
            tmux rename-window -t 1 "${windows[0]}"
            tmux send-keys -t "${windows[0]}" "cd ~/Public/MTG/mtg-postgres" C-m "clear" C-m
            tmux send-keys -t "${windows[0]}" "vim addcarta.sh" C-m
            tmux split-window -v -p 20 -t "${session}":"${windows[0]}"
            tmux select-pane -t 2
            # Remember to first start the process with `sudo systemctl start postgresql.service`
            tmux send-keys -t "${windows[0]}" "sudo -u postgres -i" # `&& psql && \c mtg`

            # Markdown Window
            tmux new-window -t 2
            tmux rename-window -t 2 "${windows[1]}"
            tmux send-keys -t "${windows[1]}" "cd ~/Public/Dev/Alura/PostgreSQL" C-m "clear" C-m
            tmux send-keys -t "${windows[1]}" "vim PostgreSQL.md" C-m

            # Test Window
            tmux new-window -t 3
            tmux rename-window -t 3 "${windows[2]}"
            tmux send-keys -t "${windows[2]}" "cd ~/Public/MTG/mtg-postgres" C-m "clear" C-m
        fi

        # Attach to default window
        tmux select-window -t 1
        tmux select-pane -t 1
        tmux a -t "${session}":"${windows[0]}"
    elif [[ ${env^^} == "${validSessions[2]^^}" ]]; then
        local session="Frontend-Mentor"
        declare -a local windows=("project" "styleguide" "bash")

        existingSession=$(tmux list-sessions | grep -i frontend-mentor | sed s/:.*//)

        # Check if session already exist before creating one
        if [[ ${existingSession^^} != "${session^^}" ]]; then
            tmux new-session -d -s $session

            # Project Script Window
            tmux rename-window -t 1 "${windows[0]}"
            tmux send-keys -t "${windows[0]}" "cd ~/Public/Dev/frontend-mentor" C-m "clear" C-m

            # Styleguide Window
            tmux new-window -t 2
            tmux rename-window -t 2 "${windows[1]}"
            tmux send-keys -t "${windows[1]}" "cd ~/Public/Dev/frontend-mentor" C-m "clear" C-m

            # Bash Window
            tmux new-window -t 3
            tmux rename-window -t 3 "${windows[2]}"
            tmux send-keys -t "${windows[2]}" "cd ~/Public/Dev/frontend-mentor" C-m "clear" C-m
        fi

        # Attach to default window
        tmux select-window -t 1
        tmux select-pane -t 1
        tmux a -t "${session}":"${windows[0]}"
    else
        echo "Please choose one of the following valid session names:"
        echo "${validSessions[@]}" | tr " " "\n"
    fi
}

if [[ $1 == "" ]]; then
    echo "Please type session setup name."
else
    tmuxenv "$1" "$2"
fi
