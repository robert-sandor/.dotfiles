set -gx FZF_DEFAULT_OPTS "\
    --height=40% \
    --min-height=20 \
    --reverse \
    --exit-0 \
    --select-1 \
    --border=rounded \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --color=selected-bg:#45475a"

fzf --fish | source
