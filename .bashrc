#
# ~/.bashrc
#

 
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##Gui##

# Prompt #

# alias ls='ls --color=auto'

# No color
# PS1='[\u@\h \W]\$ '

# Default
PS1='\[\033[01;36m\][\u@\h\[\033[01;37m\] \W\[\033[01;36m\]]\$ \[\033[00m\]'

# Full path
# PS1='\[\033[01;36m\][\u@\h\[\033[01;37m\] \w\[\033[01;36m\]]\$ \[\033[00m\]'

# Current and last dir only
# export PS1="$(basename $(dirname $PWD))/$(basename $PWD)"


##Behavior##

# Changes > overwrite to >|
set -o noclobber

##Aliases##

alias ll="ls -lA"
alias lsa="ls -A"
alias v="vim"
alias V="sudo vim"
alias rv="sudo vim"
alias e="emacs -nw"
alias p="pacman"
alias P="sudo pacman"
alias mount="mount |column -t"
alias del="mv --force -t ~/.Trash"
alias code="cd ~/Code/"
alias ccode="cd ~/Code/C/00_Projects/"
alias t="./test"
