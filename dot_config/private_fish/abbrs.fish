# act
abbr -a act 'act --container-architecture linux/amd64'
# ansible
abbr -a aplay 'ansible-playbook -v ./playbooks/'
# docker compose
abbr -a dcd 'docker compose down'
abbr -a dcl 'docker compose logs -f'
abbr -a dcp 'docker compose ps -a'
abbr -a dcr 'docker compose restart'
abbr -a dcu 'docker compose up -d'
# docker
abbr -a dl 'docker logs -f'
abbr -a dp 'docker ps -a'
abbr -a dr 'docker restart'
# better ls - eza
abbr -a ls eza
abbr -a l 'eza -lag'
abbr -a la 'eza -a'
abbr -a ll 'eza -lg'
abbr -a lla 'eza -lag'
abbr -a lt 'eza --tree'
# lazygit
abbr -a lg lazygit
# some ssh goodies
abbr -a sshconf 'cd $HOME/.ssh; nvim config; cd -'
abbr -a sshpub 'bat -pp $HOME/.ssh/id_ed25519.pub'
# brew
abbr -a bubu "brew update && brew outdated && brew upgrade && brew cleanup"
# bat instead of cat
abbr -a cat "bat -p"
abbr -a mkdir "mkdir -pv"
abbr -a cp "cp -i"
abbr -a mv "mv -i"
abbr -a rm "rm -I"
