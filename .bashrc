#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

####### Paths #######
export PATH="${PATH}:/$HOME/.local/bin"

## XDG ##
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# export GNUPGHOME='$XDG_DATA_HOME'/gnupg
# gpg2 --homedir '$XDG_DATA_HOME'/gnupg
# nvidia-settings --config='$XDG_CONFIG_HOME'/nvidia/settings

## Secrets ##
if [ -f ~/Documents/Keys/secrets ]; then
    . ~/Documents/Keys/secrets
fi

####### Prompt #######
## No color ##
# PS1='[\u@\h \W]\$ '

## Get unique color based on hostname
hostnamecolor=$(hostname | od | tr ' ' '\n' | awk '{total = total + $1}END{print 30 + (total % 6)}')
# PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\[\e[${hostnamecolor}m\]\]\h \[\e[32m\]\w\[\e[0m\]\n$ '

## Cyan ##
# PS1='\[\033[01;36m\][\u@\h\[\033[01;37m\] \w\[\033[01;36m\]]\$ \[\033[00m\]'

## Cyan w/ '@' colored by hostname ##
PS1='\[\033[01;36m\][\u\[\e[${hostnamecolor}m\]\]@\[\033[01;36m\]\h\[\033[01;37m\] \w\[\033[01;36m\]]\$ \[\033[00m\]'

## Full path ##
# PS1='\[\033[01;36m\][\u@\h\[\033[01;37m\] \w\[\033[01;36m\]]\$ \[\033[00m\]'

## legacy? ##
# export PROMPT_DIRTRIM=2

####### Programs #######
TERM='st'
EDITOR="emacs"

####### Behavior #######
## Completion ##
# complete -cf sudo

## Changes > overwrite to >| ##
# set -o noclobber
# revert
# set +o noclobber

####### Aliases #######
lwrap () {
    printf '\n\n'; $@; printf '\n\n'
}

## Navigatin ##
alias lsc='ls --color=always'
alias l='lwrap "ls --color=always"'
alias lsa='lwrap "ls --color=always -A"'
alias ll='lwrap "ls --color=always -lA"'
alias lt='exa --tree --level=2'
alias mount='mount | column -t'
alias del='mv --force -t ~/.Trash'
alias code='cd ~/Code/'
alias ccode='cd ~/Code/C/00_Projects/'

## Editors ##
alias n='nvim'
alias N='sudo nvim'
alias v='vim'
alias V='sudo vim'
alias e='emacs -nw'
alias ec='emacsclient'
alias ed='emacs --daemon'
alias ped='prime-run emacs --daemon'

## Packages ##
alias p='pacman'
alias P='sudo pacman'

## Tools ##
# Only sync files if newer #
alias upsync='rsync -auvh --progress'
# Sync without preserving metadata #
alias rrsync='rsync -rvh --progress'
alias arcsync='rsync -avh --progress'
# Sync preserving meta-data #
alias arcsync='rsync -ravh --progress'
# Compare two directories #
alias rdiff='rsync -avhn --progress'
alias fdiff='diff --brief --recursive'
alias hist='cat ~/.bash_history | fzf'
alias inst='pacman -Q | fzf'
alias S='sudo "$BASH" -c "$(history -p !!)"'
alias pr="prime-run $@"
alias ds='du -h --max-depth=1'
# wifiadd () {
# nmcli device wifi connect $1 password $2
# }

## Remote ##
alias cs='ssh max@Clean-System'
alias wcs="wol $cleansysmac"
alias wccs="wol $cleansysmac && ssh max@Clean-System"


## Configure and Update ##
alias xres='vim ~/.Xresources; xrdb ~/.Xresources && echo "xrdb ~/.Xresources" || echo "ERROR: \"xrdb\" was not refreshed"'
alias bashrc='vim ~/.bashrc; source ~/.bashrc && echo "sourced ~/.bashrc" || echo "ERROR: l.bashrc" was not reloaded"'

## Games ##
alias luftrausters='prime-run steam -applaunch 233150'
alias ror='prime-run steam -applaunch 248820'
alias rimworld='prime-run steam -applaunch 294100'
alias tribalpass='prime-run steam -applaunch 470270'
alias broforce='prime-run steam -applaunch 274190'
