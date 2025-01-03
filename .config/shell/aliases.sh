#!/bin/sh

#
# Aliases
#

#------------------------------------   TP   ------------------------------------#
alias \
    dl="cd $HOME/Downloads/" \
    C="cd $HOME/Code/" \
    c="cd $XDG_CONFIG_HOME" \
    d="cd $HOME/Documents/" \

#---------------------------------   Editors   ---------------------------------#
alias \
    n='nvim' \
    N='sudo nvim' \
    v='vim' \
    V='sudo vim' \
    e='emacsclient -cl -nw || emacs -nw' \
    ec='emacsclient -c' \
    ed='emacs --daemon' \
    red='pkill -f "emacs --daemon" && emacs --daemon' \
    ped='prime-run emacs --daemon'

# Use Vim if available
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

#----------------------------------   Pacman   ----------------------------------#
alias \
    y='yay' \
    yass='yay -Ss'\
    p='pacman --color=always' \
    P='sudo pacman --color=always' \
    ps='pacman -Q | fzf' \
    psz="pacman -Qi | grep -E '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | fzf" \
    plsz="pacman -Qi | grep -E '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less" \
    pds="pactree -c" \
    pds="pactree -r" \
    pfs="pacman -Ql" \
    pfo="pacman -Qo" \
    pqs="pacman -Q | grep" \
    pup='yay -Qu' \
    Pc='echo "sudo paccache -rk1..." && sudo paccache -rk1 && echo "Cache Cleaned, Leaving Latest Version" || echo "Something went wrong"' \
    Pcc='echo "sudo pacman -Scc..." && sudo pacman -Scc && echo "Cache Cleared" || echo "Something went wrong"' \
    ph='echo -e \
"p	pacman
P	sudo pacman
ps	Search installed packages
psz	Sort packages by size - fzf
plsz	Sort packages by size - less
pds	Display package dependencies
prs	Display packages that require a package
pfs	List files installed by a package
pfo	Display the package that owns a file
pbs	Display the package a program belongs to
pqs	Search for a package by name
pup	List upgradable packages
Pc	Clean cache, keeping the latest version
Pcc	Clear cache\n"'

pbs () {
    pacman -Ql | grep "$1$" | cut -f1 -d ' ' | uniq
}    

prs () {
    [ -n "${1}" ] && 
	pacman -Qi "$1" | grep 'Required By' ||
	    echo "Please provide a package"
}

#-----------------------------------   XDG    -----------------------------------#
# move?
alias \
    units='units --history "$XDG_CACHE_HOME"/units_history' \
    nvidia-settings="nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings"

## Color ##
alias \
    ls='ls --color=always' \
    grep='grep --color=auto' \
    fgrep='fgrep --color=auto' \
    egrep='egrep --color=auto' \
    diff='diff --color=auto' \
    watch='watch -c' \
    ip='ip -color=auto' \
    pactree='pactree -c'
    # less='less -c' \

#---------------------------------   Defaults   ---------------------------------#

alias \
    cp='cp -iv' \
    mv='mv -iv' \
    bc='bc -ql' \
    df='df -h' \
    mount='mount | column -t' \
    which='type -all' \
    rsync='rsync -vpl' \
    trash-put='trash-put -v' \
    mkdir='mkdir -pv' \
    ffmpeg='ffmpeg -hide_banner' \
    spotifyd='spotifyd --no-daemon'
    # rsync='rsync -vrplu'
    # rm='rm -iv' \

# man () {
# { tldr "$1" && man "$1"; } | less
# }

# man () {
# { tldr "$1" | less -R && man "$1" | less -R; }
# }

#---------------------------------   Warnings   ---------------------------------#

# Warn about unsafe functions

funcwarn () {
    echo "This is an alias to block the accidental usage of $1. If necessary use \\$1 or the full path"
    }

sudowarn () {
    case $@ in 
	poweroff*) funcwarn "$@";;
	reboot*) funcwarn "$@";;
	shutdown*) funcwarn "$@";;
	rm*) funcwarn "$@";;
	*) sudo "$@";;
esac
}

alias \
    rm="funcwarn rm" \
    sudo=sudowarn

#--------------------------------   Shorthand   --------------------------------#

alias \
    sp='spotify_player'

#----------------------------------   Tools   ----------------------------------#

alias fixfeh="$HOME/.config/feh/.fehbg"

dswn () { "$@" & disown; }

#when run with dwmblocks crashes xserver?
# alias rst='pkill "$1" && "$1"'

mkdircd() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: mkdircd <directory_name>"
    else
        mkdir "$1" && cd "$1"
    fi
}

# Profiling
timel () {
    time sh -c "$@"
}

rsrt () {
    pkill $@ && $@
}

# Pad stdout with 2 lines
lwrap () { printf '\n\n'; $@; printf '\n\n'; }

# Navigatin #
alias \
    l='lwrap "ls -h --color=always"' \
    lsa='lwrap "ls -h --color=always -A"' \
    ll='lwrap "ls -h --color=always -lA"' \
    lt='exa --tree --level=2' \
    del="trash-put $@"

# Info #
alias \
    path='echo -e ${PATH//:/\\n}' \

# Power #
alias slp='sudo bash -c "echo mem > /sys/power/state"'

# Sync #
# Only sync files if newer #
alias upsync='rsync -auvh --progress'
# Sync without preserving metadata #
alias rrsync='rsync -rvh --progress'
# Sync preserving meta-data #
alias arcsync='rsync -ravh --progress'
# Compress, and give drwxr-xr-x / rw-r--r-- permissions
alias csync='rsync -avzrh --perms --chmod=Du=rwx,Dg=rx,Do=rx,Fu=rw,Fg=r,Fo=r --progress'
# Compare two directories #
alias rdiff='rsync -avhn --progress'

# Compression #
alias utar='tar -xvf'

# Alert #
# Add an "alert" alias for long running commands.  Use like so: $ sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias a='alert'

# Misc #
alias \
    fdiff='diff --brief --recursive' \
    hist="cat $HISTFILE | fzf" \
    S='sudo "$BASH" -c "$(history -p !!)"' \
    pr="prime-run" \
    dS='du -h --max-depth=1 | sort -h' \
    prff='prime-run firefox' \
    prtor='prime-run torbrowser-launcher' \
    sc='scrot -cud 5 ~/Pictures/Screenshots/Screenshot%Y%b%d-%H:%M:%S.png'

# File mgmt
ds () {
    du -sh ${@:-*} | sort -h
}

# Wifi
wifiadd () {
    nmcli device wifi connect $1 password $2
}

## Secrets ##
if [ -f ~/Documents/Keys/secrets.sh ]; then
    . ~/Documents/Keys/secrets.sh
fi
## Remote ##
alias cs='ssh max@Clean_System'
alias ns='ssh max@Nas_System'
alias wcs="wol $cleansysmac"
alias wns="wol $nassysmac"
wccs () {
  wol $cleansysmac
  echo -n 'Waiting for server to respond ...'
  while ! ping -c 1 -W 1 Clean_System > /dev/null 2>&1; do
    echo -n '.'
    sleep 1
  done
  for i in $(seq 1 5); do
      echo -n '.'
    sleep 1
  done
  echo " OK"
  ssh max@Clean_System
}

## Configure and Update ##
alias xres='vim ~/.Xresources; xrdb ~/.Xresources && echo "xrdb ~/.Xresources" || echo "ERROR: \"xrdb\" was not refreshed"'
alias bashrc='vim ~/.bashrc; source ~/.bashrc && echo "sourced ~/.bashrc" || echo "ERROR: l.bashrc" was not reloaded"'

## Games ##
alias \
    luftrausters='prime-run steam -applaunch 233150' \
    ror='prime-run steam -applaunch 248820' \
    rimworld='prime-run steam -applaunch 294100' \
    tribalpass='prime-run steam -applaunch 470270' \
    broforce='prime-run steam -applaunch 274190'
