#!/opt/homebrew/bin/fish

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

tmux new-window   -d -n services "cd ~/Projects/lusi/    && $SLEEP_COMMAND && yarn docker:rabbitmq:up; fish"
tmux split-window -h -t services "cd ~/Projects/lusi/    && $SLEEP_COMMAND && yarn docker:postgres:up; fish"
tmux split-window -h -t services "cd ~/Projects/lusi/    && $SLEEP_COMMAND && yarn docker:cassandra:up; fish"
tmux split-window -v -t services "cd ~/Projects/lusi/    && $SLEEP_COMMAND && yarn docker:minio:up; fish"
tmux split-window -h -t services "cd ~/Projects/loak/    && $SLEEP_COMMAND && ./run.sh; fish"
tmux split-window -h -t services "cd ~/Projects/lusi/    && fish"
tmux split-window -v -t services "cd ~/Projects/levi/    && fish"
tmux split-window -h -t services "cd ~/Projects/lui/     && fish"
tmux split-window -h -t services "cd ~/Projects/lapi/    && fish"
tmux select-layout -t services tiled

zed ~/Projects/luilibs ~/Projects/levi ~/Projects/lusi ~/Projects/lui

bw copy totp "Lavego Login"
