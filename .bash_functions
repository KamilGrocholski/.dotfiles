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

# extract usage: ex <file>
function ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
