set -gx HOMEBREW_BUNDLE_FILE ~/.config/Brewfile

abbr -a brewfile "chezmoi edit -a --watch $HOMEBREW_BUNDLE_FILE"
abbr -a brewup "brew bundle install --cleanup"

function brew-bundle -d "Recreate the Brewfile"
    brew bundle dump --describe --force
    chezmoi re-add ~/.config/Brewfile
end

function brew-add -d 'Homebrew install formula'
    set -l selected (brew formulae | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info {}")
    if test -n "$selected"
        brew install $selected
        echo "Adding $selected to Brewfile"
        brew-bundle
    end
end

function brew-remove -d 'Homebrew install formula'
    set -l selected (brew leaves | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info {}")
    if test -n "$selected"
        brew uninstall --zap $selected
        echo "Removing $selected from Brewfile"
        brew-bundle
    end
end

function brew-add-cask -d 'Homebrew install cask'
    set -l selected (brew casks | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info --cask {}")
    if test -n "$selected"
        brew install --cask $selected
        echo "Adding $selected cask to Brewfile"
        brew-bundle
    end
end

function brew-remove-cask -d 'Homebrew install cask'
    set -l selected (brew list --casks | fzf -m -q "$argv[1]" --preview="HOMEBREW_COLOR=true brew info --cask {}")
    if test -n "$selected"
        brew uninstall --cask $selected
        echo "Removing $selected cask from Brewfile"
        brew-bundle
    end
end
