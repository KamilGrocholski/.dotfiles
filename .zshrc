# Set the shell to zsh
export SHELL=/bin/zsh

export ANTIGEN=$HOME/antigen.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/bin

export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
    --preview 'batcat --style=numbers --color=always --line-range :500 {}'"

set -o vi

# export TERMINAL=alacritty
export EDITOR="/usr/bin/nvim"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# sonar
export PATH="$PATH:$HOME/sonar-scanner/bin"

# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# config bare git repo
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source $ANTIGEN

antigen bundle jeffreytse/zsh-vi-mode
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# bun completions
[ -s "/home/kamil/.bun/_bun" ] && source "/home/kamil/.bun/_bun"
