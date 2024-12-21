set -gx HOMEBREW_BUNDLE_FILE ~/.config/Brewfile

abbr -a brewfile "chezmoi edit -a --watch $HOMEBREW_BUNDLE_FILE"
abbr -a brewup "brew bundle install --cleanup"
abbr -a brewbun "brew bundle dump -f"

function brew-install -d 'Homebrew install formula'
    set -l selected (brew formulae | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info {}")
    test -n "$selected"; and brew install $selected
end

function brew-uninstall -d 'Homebrew install formula'
    set -l selected (brew leaves | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info {}")
    test -n "$selected"; and brew uninstall --zap $selected
end

function brew-install-cask -d 'Homebrew install cask'
    set -l selected (brew casks | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info --cask {}")
    test -n "$selected"; and brew install --cask $selected
end

function brew-uninstall-cask -d 'Homebrew install cask'
    set -l selected (brew list --casks | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info --cask {}")
    test -n "$selected"; and brew uninstall --cask $selected
end
