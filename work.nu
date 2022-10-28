#!/usr/bin/env nu

let session_name = "work"
let container_pane_name = "container"
let current_session = (tmux display-message -p '#S')
let shell_cmd = "nu"
let sleep_cmd = "sleep 50sec"

if (do -i { tmux switch-client -t $session_name } | complete | get exit_code | into bool | not $in) {
  tmux kill-session -t $current_session
  exit 0
}

tmux rename-session $session_name
tmux rename-window "main"

# launch docker in the background
^open -g -j -a Docker

tmux new-window   -d -n $container_pane_name ("cd ~/Projects/lusi/; " + $sleep_cmd + "; yarn docker:cassandra:up; " + $shell_cmd)
tmux split-window -h -t $container_pane_name ("cd ~/Projects/lusi/; " + $sleep_cmd + "; yarn docker:rabbitmq:up; " + $shell_cmd)
tmux split-window -h -t $container_pane_name ("cd ~/Projects/lusi/; " + $sleep_cmd + "; yarn docker:minio:up; " + $shell_cmd)
tmux split-window -v -t $container_pane_name ("cd ~/Projects/lasi/; " + $shell_cmd)
tmux split-window -h -t $container_pane_name ("cd ~/Projects/lusi/; " + $shell_cmd)
tmux split-window -h -t $container_pane_name ("cd ~/Projects/levi/; " + $shell_cmd)
tmux split-window -v -t $container_pane_name ("cd ~/Projects/lui/ ; " + $shell_cmd)
tmux split-window -h -t $container_pane_name ("cd ~/Projects/     ; " + $shell_cmd)
tmux split-window -h -t $container_pane_name ("cd ~/Projects/     ; " + $shell_cmd)
tmux select-layout   -t $container_pane_name tiled

tmux new-window -d -n "levi" ("cd ~/Projects/levi/; " + $shell_cmd)

tmux new-window -d -n "lusi" ("cd ~/Projects/lusi/; " + $shell_cmd)

tmux new-window -d -n "luilibs" ("cd ~/Projects/luilibs/; " + $shell_cmd)

bw copy passwordtotp lavego login
