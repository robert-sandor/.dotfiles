# safer cp, mv and rm
abbr cp "cp -iv"
abbr mv "mv -iv"
abbr rm "rm -iv"

# fast fish config access
abbr fishconf "cd $__fish_config_dir; nvim config.fish"
abbr fishrel "source $__fish_config_dir/config.fish"

# ssh
abbr sshconf "cd $HOME/.ssh; nvim config"
abbr sshpub "bat -pp $HOME/.ssh/id_ed25519.pub"

# homebrew
abbr bubu "brew update && brew outdated && brew upgrade && brew cleanup"

# ansible
if type -q ansible-playbook
    abbr aplay ansible-playbook
end