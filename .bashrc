# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history

alias direxplorer='nautilus -s .'
alias op='xdg-open'

# alias for doing git ops on the dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.mycfg/ --work-tree=$HOME'




# Functions

function git-co-recent {
        while getopts "hn:" opt; do
        case $opt in
        h)
        usage
        exit 1
        ;;
        n)
        NUM=$OPTARG
        ;;
        \?)
        usage
        exit 1
        ;;
        esac
        done

        NUM=${NUM-10} # default to 10 lines

        # This: `awk ' !x[$0]++'` removes duplicates.  See http://stackoverflow.com/questions/11532157
        UNIQUE_BRANCHES=$(git reflog | egrep -io "moving from ([^[:space:]]+)" | awk '{ print $3 }' | awk ' !x[$0]++')

        # Exclude branches that don't exist locally
        BRANCH_CHOICES=( $(echo "$UNIQUE_BRANCHES" | while read line; do
        git rev-parse --verify "$line" &>/dev/null && echo "$line"
        done | head -n "$NUM") )

        PS3="Choose a branch: "
        select d in "${BRANCH_CHOICES[@]}"; do test -n "$d" && break; echo ">>> Invalid Selection"; done

        git checkout "$d"
}



# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
