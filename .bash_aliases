# alias for working with dotfiles
# https://www.youtube.com/watch?v=tBoLDpTWVOM
# git init --bare $HOME/dotfiles
# alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' (add this alias to .bashrc)
# bash
# config config --local status.showUntrackedFiles no
#
# Basic usage example:
#
# config add /path/to/file
# config commit -m "A short message"
# config push
#
# WHAT'S THE REASON FOR THE GIT BARE REPO?
#
# By using the git bare repo, you can have nested git repos in your home directory and there will not be any issue with keeping things straight.   That is the reason for the git bare repo and having an alias ("config").
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 

alias rl="source ~/.bashrc; echo '~/.bashrc reloaded.'"

# directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
