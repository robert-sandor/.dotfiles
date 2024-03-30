#!/bin/sh

# selected=$(fd -d 1 -t d . ~ ~/dev ~/.config | fzf-tmux -p --border-label " Switch to directory ")
selected=$(zoxide query -l | fzf-tmux -p --border-label " Switch to directory ")

if [ -z "$selected" ]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [ -z "$tmux_running" ]; then
  tmux new-session -s "$selected_name" -c "$selected"
  exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

if [ -z "$TMUX" ]; then
  tmux attach -t "$selected_name"
else
  tmux switch-client -t "$selected_name"
fi
