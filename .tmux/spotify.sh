#!/bin/bash

# tm_battery="#[fg=$base0F,bg=$base00] ♥ #(battery)"
# tm_host="#[fg=$base0E,bg=$base00] #h "
tm_mem_cpu="#[fg=$base0E,bg=$base00]#(tmux-mem-cpu-load -m 2 -i 2 |
  awk '{print $1 $4}' | sed 's/%/% MEM /' | sed 's/ MEM/MEM/' |
  sed 's/%$/% CPU/' | sed 's/ CPU/CPU/')"

set -g status-right "$tm_mem_cpu"

if-shell -b '[ "$(playerctl --player=spotify status)" ==  "Playing" ]' {
  # artist="#(playerctl --player=spotify metadata --format '{{artist}}')"
  album="#(playerctl --player=spotify metadata --format '{{album}}')"
  title="#(playerctl --player=spotify metadata --format '{{title}}')"
  tm_spotify="#[bg=$base00,fg=$base0D] ♫ $album - $title"

  set -g status-right "$tm_spotify $tm_mem_cpu"
}

if-shell -b '[ "$(playerctl --player=spotify status)" ==  "Paused" ]' {
  tm_paused="#[bg=$base00,fg=$base0D] ♫ Paused"

  set -g status-right "$tm_paused $tm_mem_cpu"
}

