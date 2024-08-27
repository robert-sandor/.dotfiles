function l -d 'List files with eza' -w eza
    eza -la $argv
end

function cat -d 'cat with bat' -w bat
    bat -p $argv
end

function sshf -d 'SSH with fzf'
    set -l selected (cat ~/.ssh/known_hosts | cut -d ' ' -f1 | uniq | fzf -q "$argv[1]")
    test -n "$selected"; and ssh -t "$selected"
end

function sshrm -d 'Remove ssh keys'
    set -l selected (cat ~/.ssh/known_hosts | cut -d ' ' -f1 | uniq | fzf -q "$argv[1]")
    test -n "$selected"; and ssh-keygen -R "$selected"
end

function brew-install -d 'Homebrew install formula'
    set -l selected (brew formulae | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info {}")
    test -n "$selected"; and brew install $selected
end

function brew-uninstall -d 'Homebrew install formula'
    set -l selected (brew leaves | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info {}")
    test -n "$selected"; and brew uninstall --zap $selected
end

if test (uname) = "Darwin"
    function brew-install-cask -d 'Homebrew install cask'
        set -l selected (brew casks | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info --cask {}")
        test -n "$selected"; and brew install --cask $selected
    end

    function brew-uninstall-cask -d 'Homebrew install cask'
        set -l selected (brew list --casks | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info --cask {}")
        test -n "$selected"; and brew uninstall --cask $selected
    end
end

function lg -d 'lazygit with tmux' -w lazygit
    if set -q TMUX
        tmux display-popup -h 90% -w 90% -d "#{pane_current_path}" -E "lazygit $argv"
    else
        lazygit $argv
    end
end

function dotfiles -d 'manage dotfiles'
    if test -f "$argv[1]"
        chezmoi edit -a --watch "$argv[1]"
    else
        set file (chezmoi managed -i files -p absolute | fzf -q "$argv[1]")
        test -n "$file"; and chezmoi edit -a --watch "$file"
    end
end
