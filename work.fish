#!/usr/local/bin/fish

tmux rename-session "work"
tmux rename-window "main"

tmux new-window -d -n "levi dev"   "cd ~/Projects/levi/ && $EDITOR; fish"

tmux new-window -d -n "lusi dev"   "cd ~/Projects/lusi/ && $EDITOR; fish"

tmux new-window   -d -n "services" "cd ~/Projects/lusi/services/cassandra && docker compose up; fish"
tmux split-window -h -t "services" "cd ~/Projects/lusi/services/rabbitMQ  && docker compose up; fish"
tmux split-window -h -t "services" "cd ~/Projects/lusi/services/minio     && docker compose up; fish"
tmux split-window -v -t "services" "cd ~/Projects/lasi/                   && fish"
tmux split-window -h -t "services" "cd ~/Projects/lusi/                   && fish"
tmux split-window -h -t "services" "cd ~/Projects/levi/                   && fish"
tmux split-window -v -t "services" "cd ~/Projects/lui/                    && fish"
tmux split-window -h -t "services" "cd ~/Projects/                        && fish"
tmux split-window -h -t "services" "cd ~/Projects/                        && fish"
tmux select-layout   -t "services" tiled

bw copy passwordtotp "Lavego Login"
