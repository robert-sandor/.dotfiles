#!/usr/bin/env bash

selected=$(fd -d 1 -t d . ~ ~/dev ~/.config | fzf-tmux -p --prompt "Select directory > ")

if [[ -z $selected ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
	tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
