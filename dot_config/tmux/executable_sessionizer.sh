#!/usr/bin/env bash
set -euo pipefail

function paths {
  SELECTED_PATH=$(
    zoxide query -l |
      fzf --tmux --border-label " Switch to session in directory " ||
      true
  )

  [ -z "$SELECTED_PATH" ] && exit 0

  zoxide add "$SELECTED_PATH"

  SELECTED_PATH_LOWER=$(echo "$SELECTED_PATH" | tr "[:upper:]" "[:lower:]")
  SESSION_NAME="$(echo "$(basename "$(dirname "$SELECTED_PATH_LOWER")")/$(basename "$SELECTED_PATH_LOWER")" | tr . _)"

  tmux has-session -t "$SESSION_NAME" 2>/dev/null ||
    tmux new-session -ds "$SESSION_NAME" -c "$SELECTED_PATH"

  if [ -n "${TMUX-}" ]; then
    tmux switch-client -t "$SESSION_NAME"
  else
    tmux attach -t "$SESSION_NAME"
  fi
}

function sessions {
  SESSION_NAME=$(
    tmux list-sessions |
      sed -E 's/:.*$//' |
      rg -v "$(tmux display-message -p '#S')" |
      fzf --tmux || true
  )

  if [ -n "$SESSION_NAME" ]; then
    if [ -n "${TMUX-}" ]; then
      tmux switch-client -t "$SESSION_NAME"
    else
      tmux attach -t "$SESSION_NAME"
    fi
  fi
}

ACTION=${1-}

case "$ACTION" in
paths)
  paths "$@"
  ;;
sessions)
  sessions "$@"
  ;;
esac
