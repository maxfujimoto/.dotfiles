#
# ~/.bashrc
#

 
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Paths
export PATH="${PATH}:/$HOME/.local/bin"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# export GNUPGHOME="$XDG_DATA_HOME"/gnupg
# gpg2 --homedir "$XDG_DATA_HOME"/gnupg
# nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings


# Prompt #

# No color
# PS1='[\u@\h \W]\$ '

# Default
PS1='\[\033[01;36m\][\u@\h\[\033[01;37m\] \w\[\033[01;36m\]]\$ \[\033[00m\]'
export PROMPT_DIRTRIM=2 

# Full path
# PS1='\[\033[01;36m\][\u@\h\[\033[01;37m\] \w\[\033[01;36m\]]\$ \[\033[00m\]'

# Current and last dir only
# export PS1="$(basename $(dirname $PWD))/$(basename $PWD)"


##Behavior##

# Completion
# complete -cf sudo

# Changes > overwrite to >|
set -o noclobber

##Aliases##

# Navigatin
alias l='echo -e "\n\n"; ls; echo -e "\n\n"'
alias ll="ls -A"
alias lsa='echo -e "\n"; ls -lA; echo -e "\n"'
alias mount="mount |column -t"
alias del="mv --force -t ~/.Trash"
alias code="cd ~/Code/"
alias ccode="cd ~/Code/C/00_Projects/"
alias cl='cd $1; ll'


# Editors
alias n="nvim"
alias v="vim"
alias V="sudo vim"
alias rv="sudo vim"
alias e="emacs -nw"

# Packages
alias p="pacman"
alias P="sudo pacman"

# Tools
alias t="./test"
alias upsync="rsync -auvh --progress"
alias rrsync="rsync -rvh --progress"
alias arcsync="rsync -avh --progress"
alias fdiff="diff --brief --recursive"
alias sd="sudo powerprompt"
alias hist="cat ~/.bash_history | fzf"

# Confiugre and Update
alias xres="vim ~/.Xresources; xrdb ~/.Xresources & echo 'xrdb ~/.Xresources'"
alias bashrc="vim ~/.bashrc; source ~/.bashrc & echo 'source ~/.bashrc'"
