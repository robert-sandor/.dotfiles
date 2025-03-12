# disable fish greeting
set -g fish_greeting

# PATH
command -q brew; and fish_add_path (brew --prefix rustup)/bin

if status --is-interactive
    fish_vi_key_bindings

    set -gx SHELL (which fish)
    set -gx EDITOR nvim
    set -gx MANPAGER "nvim +Man!"

    set -l fish_conf_dir ~/.config/fish

    function sshf
        set selected (cat ~/.ssh/known_hosts | cut -d ' ' -f1 | uniq | fzf-tmux -p -- -q "$argv[1]")
        test -n "$selected"; and ssh -t "$selected"
    end

    function sshrm
        set selected (cat ~/.ssh/known_hosts | cut -d ' ' -f1 | uniq | fzf-tmux -p -- -q "$argv[1]")
        test -n "$selected"; and ssh-keygen -R "$selected"
    end

    # Aliases
    function tm -d "tmux sessionizer"
        command ~/.config/tmux/sessionizer.sh paths
    end

    # Interactive shell initialisation
    command -q brew; and source "$fish_conf_dir/brew.fish"
    command -q chezmoi; and source "$fish_conf_dir/chezmoi.fish"
    command -q fzf; and source "$fish_conf_dir/fzf.fish"
    command -q zoxide; and zoxide init fish | source
    command -q starship; and starship init fish | source; and enable_transience
    command -q mise; and mise activate fish | source
    command -q yazi; and source "$fish_conf_dir/yazi.fish"

    # abbreviations
    source "$fish_conf_dir/abbrs.fish"
end
