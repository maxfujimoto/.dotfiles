#
# ~/.bashrc
#

# If not running interactively, do nothing
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

####### Load Paths #######

## Aliases ##
if [ -f ~/.config/shell/aliases.sh ]; then
  . ~/.config/shell/aliases.sh
fi

## Secrets ##
if [ -f ~/Documents/Keys/secrets.sh ]; then
    . ~/Documents/Keys/secrets.sh
fi

####### Prompt #######
## Get unique color based on hostname
hostnamecolor=$(cat /etc/hostname | od | tr ' ' '\n' | awk '{total = total + $1}END{print 30 + (total % 6)}')
# hostnamecolor=$(hostname | od | tr ' ' '\n' | awk '{total = total + $1}END{print 30 + (total % 6)}')

## No color ##
# PS1='[\u@\h \W]\$ '

## Two Line ##
# PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\[\e[${hostnamecolor}m\]\]\h \[\e[32m\]\w\[\e[0m\]\n$ '

## Cyan ##
# PS1='\[\033[01;36m\][\u@\h\[\033[01;37m\] \w\[\033[01;36m\]]\$ \[\033[00m\]'

PS1='\[\e[96;1m\][\u\[\e[${hostnamecolor}m\]@\[\e[38;5;51m\]\H \[\e[97m\]\w\[\e[38;5;51m\]]\$ \[\e[0m\]'
## Cyan w/ '@' colored by hostname ##
export PROMPT_DIRTRIM=2
case "$TERM" in
"dumb")
    PS1="> "
    ;;
# st*|[ex]term*|tmux*|linux)
#     PS1='\[\e[96;1m\][\u\[\e[${hostnamecolor}m\]@\[\e[38;5;51m\]\H \[\e[97m\]\w\[\e[38;5;51m\]]\$ \[\e[0m\]'
#     ;;
# *)
#     PS1="> "
#     ;;
esac

####### Behavior #######
## Completion ##
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## Completion ##

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

complete -c pr
# complete -cf sudo 

## Behavior ##
# Changes > overwrite to >| #
# set -o noclobber

