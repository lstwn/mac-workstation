#!/usr/local/bin/fish

cd
tmux rename-session "work"
tmux rename-window "main"

tmux new-window -d -n "levi dev"   "cd ~/Projects/levi/ && vim; fish"
tmux new-window -d -n "levi run"   "cd ~/Projects/levi/ && docker compose up; fish"
tmux split-window -v -t "levi run" "cd ~/Projects/levi/ && fish"
tmux split-window -h -t "levi run" "cd ~/Projects/levi/ && fish"

tmux new-window -d -n "lusi dev"   "cd ~/Projects/lusi/ && vim; fish"
tmux new-window -d -n "lusi run"   "cd ~/Projects/lusi/ && docker compose up; fish"
tmux split-window -v -t "lusi run" "cd ~/Projects/lusi/ && fish"
tmux split-window -h -t "lusi run" "cd ~/Projects/lusi/ && fish"

bw copy passwordtotp "Lavego Login"
