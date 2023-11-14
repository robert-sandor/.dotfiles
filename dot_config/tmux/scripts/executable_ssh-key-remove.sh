#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	ssh-keygen -R "$1"
	exit $?
fi

selected=$(cat ~/.ssh/known_hosts | cut -d ' ' -f1 | uniq | fzf-tmux -p --border-label " Choose host to remove ")

if [[ -z $selected ]]; then
	exit 0
fi

ssh-keygen -R "$selected"
