#!/usr/local/bin/fish

set SESSION_NAME "work"
set CURRENT_SESSION (tmux display-message -p '#S')

if tmux switch-client -t "$SESSION_NAME" &> /dev/null
  tmux kill-session -t "$CURRENT_SESSION"
  exit 0
end

tmux rename-session "$SESSION_NAME"
tmux rename-window "main"

tmux new-window -d -n "levi dev"   "cd ~/Projects/levi/ && fish"

tmux new-window -d -n "lusi dev"   "cd ~/Projects/lusi/ && fish"

# launch docker in the background
open -g -j -a Docker

tmux new-window   -d -n "services" "cd ~/Projects/lusi/services/cassandra && sleep 30 && docker compose up; fish"
tmux split-window -h -t "services" "cd ~/Projects/lusi/services/rabbitMQ  && sleep 30 && docker compose up; fish"
tmux split-window -h -t "services" "cd ~/Projects/lusi/services/minio     && sleep 30 && docker compose up; fish"
tmux split-window -v -t "services" "cd ~/Projects/lasi/                   && fish"
tmux split-window -h -t "services" "cd ~/Projects/lusi/                   && fish"
tmux split-window -h -t "services" "cd ~/Projects/levi/                   && fish"
tmux split-window -v -t "services" "cd ~/Projects/lui/                    && fish"
tmux split-window -h -t "services" "cd ~/Projects/                        && fish"
tmux split-window -h -t "services" "cd ~/Projects/                        && fish"
tmux select-layout   -t "services" tiled

bw copy passwordtotp "Lavego Login"
