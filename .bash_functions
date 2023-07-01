# Jeroen Janssens' jumper functions
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
# with some modifications: completion, show marks if no args given, make marks work on OS X 10.8.
export MARKPATH=$HOME/.marks

function j {
    if [ -z "$1" ]; then
        marks
    else
        cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
    fi
}

function _jump() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$( ls $MARKPATH )" -- $cur) )
}
complete -F _jump j

function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}

function unmark { 
    rm -i $MARKPATH/$1 
}

function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- && echo
}

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# clean the current directory
function clean() {
    read -p "remove everything here? (y/N)" yn
    if [ $yn = "y" ]; then
        rm -rf ./* ./.*
    fi
}

# check file size
function fs() {
    du -sh ${1} | awk '{print $1}'
}

# check processes using a port
function port() {
    lsof -iTCP:$1 -sTCP:LISTEN
}
