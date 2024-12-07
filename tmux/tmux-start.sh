#!/usr/bin/env bash

session_name="zalupa"

# 1. First you check if a tmux session exists with a given name.
tmux has-session -t $session_name 2> /dev/null

# 2. Create the session if it doesn't exists.
if [[ $? -ne 0 ]]; then
    TMUX='' tmux new-session -d -s "$session_name"
    tmux split-window -v
    tmux split-window -h
    tmux select-pane -t 0
    tmux split-window -h
    tmux select-pane -t 0
    tmux -2 attach-session -d
fi

# 3. Attach if outside of tmux, switch if you're in tmux.
#tmux attach -t $session_name
#if [[ -z "$TMUX" ]]; then
#    tmux attach -t $session_name
#  else
#    #tmux switch-client -t $session_name
#fi
