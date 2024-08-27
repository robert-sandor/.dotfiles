# disable greeting
set -U fish_greeting

set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_CACHE_HOME "$HOME/.local/cache"

# homebrew
test (uname) = "Darwin"; and test -x /opt/homebrew/bin/brew; and /opt/homebrew/bin/brew shellenv | source
test (uname) = "Linux"; and test -x /home/linuxbrew/.linuxbrew/bin/brew; and /home/linuxbrew/.linuxbrew/bin/brew shellenv | source

# update paths for bins
for path in "$HOME/.local/bin" \
            "$HOME/.local/share/bob/nvim-bin/" \
            "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
    fish_add_path $path
end

if status is-interactive
    # nvim as the editor and man pager
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx MANPAGER "nvim +Man!"

    # set vi mode
    set -g fish_key_bindings fish_vi_key_bindings

    # zoxide - cd but better
    type -q zoxide; and zoxide init fish | source
            
    # docker completions
    type -q docker; and docker completion fish | source

    # delta - diff viewer
    type -q delta; and delta --generate-completion fish | source

    # mise - package manager for python, node and go, and more ...
    type -q mise; and mise activate fish | source

    # fzf - fuzzy find everything
    type -q fzf; and fzf --fish | source

    # starship prompt
    type -q starship; and starship init fish | source

    # bob - neovim version manager
    type -q bob; and bob complete fish | source

    # load aliases
    for file in "aliases.fish" \
                "abbr.fish" \
                "functions.fish" \
                "fzf.fish"
        set -l filepath "$__fish_config_dir/$file"
        test -f "$filepath"; and source "$filepath"
    end
end
