#!/bin/bash
selected=`cat ~/.tmux/.tmux-cht-languages ~/.tmux/.tmux-cht-command | fzf`
read -p "Enter Query: " query

existSession=$(tmux ls 2> /dev/null) 

if grep -qs "$selected" ~/.tmux/.tmux-cht-languages; then
  query=`echo $query | tr ' ' '+'`
  echo "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
  if [ "$existSession" == "" ]; then
    bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
  else
    tmux neww bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
  fi
else
  echo "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
  if [ "$existSession" == "" ]; then
    bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
  else
    tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
  fi
fi

