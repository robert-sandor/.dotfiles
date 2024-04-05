function l -d 'List files with eza' -w eza
    eza -la $argv
end

function ssht -d 'SSH with tmux'
    set -l selected (cat ~/.ssh/known_hosts | cut -d ' ' -f1 | uniq | fzf -q "$argv[1]")
    test -n "$selected"; and ssh -t "$selected" 'tmux new -A -s $USER'
end

function sshrm -d 'Remove ssh keys'
    set -l selected (cat ~/.ssh/known_hosts | cut -d ' ' -f1 | uniq | fzf -q "$argv[1]")
    test -n "$selected"; and ssh-keygen -R "$selected"
end

function brew-install -d 'Homebrew install formula'
    set -l selected (brew formulae | fzf -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info {}")
    test -n "$selected"; and brew install "$selected"
end

function brew-uninstall -d 'Homebrew install formula'
    set -l selected (brew leaves | fzf -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info {}")
    test -n "$selected"; and brew uninstall --zap "$selected"
end

function brew-install-cask -d 'Homebrew install cask'
    set -l selected (brew casks | fzf -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info --cask {}")
    test -n "$selected"; and brew install --cask "$selected"
end

function brew-uninstall-cask -d 'Homebrew install cask'
    set -l selected (brew list --casks | fzf -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info --cask {}")
    test -n "$selected"; and brew uninstall --cask "$selected"
end
