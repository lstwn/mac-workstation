#!/usr/local/bin/fish

set SESSION_NAME work
set CURRENT_SESSION (tmux display-message -p '#S')
set SLEEP_COMMAND "sleep 50"

if tmux switch-client -t "$SESSION_NAME" &>/dev/null
    tmux kill-session -t "$CURRENT_SESSION"
    exit 0
end

tmux rename-session "$SESSION_NAME"
tmux rename-window main

# launch docker in the background
open -g -j -a Docker

tmux new-window -d -n services "cd ~/Projects/lusi/services/rabbitMQ  && $SLEEP_COMMAND && docker compose up; fish"
tmux split-window -h -t services "cd ~/Projects/lusi/services/cassandra && $SLEEP_COMMAND && docker compose up; fish"
tmux split-window -h -t services "cd ~/Projects/lusi/services/postgres  && $SLEEP_COMMAND && docker compose up; fish"
tmux split-window -v -t services "cd ~/Projects/lusi/services/minio     && $SLEEP_COMMAND && docker compose up; fish"
tmux split-window -h -t services "cd ~/Projects/lasi/                   && fish"
tmux split-window -h -t services "cd ~/Projects/lusi/                   && fish"
tmux split-window -v -t services "cd ~/Projects/levi/                   && fish"
tmux split-window -h -t services "cd ~/Projects/luigui/                 && fish"
tmux split-window -h -t services "cd ~/Projects/                        && fish"
tmux select-layout -t services tiled

tmux new-window -d -n levi "cd ~/Projects/levi/ && fish"

tmux new-window -d -n lusi "cd ~/Projects/lusi/ && fish"

tmux new-window -d -n luilibs "cd ~/Projects/luilibs/ && fish"

tmux new-window -d -n luigui "cd ~/Projects/luigui/ && fish"

tmux new-window -d -n lapi "cd ~/Projects/lapi/ && fish"

tmux new-window -d -n dotfiles "cd ~/Projects/dotfiles/ && fish"

bw copy passwordtotp "Lavego Login"
