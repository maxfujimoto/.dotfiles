#!/bin/sh

#
# Aliases
#

lwrap () {
    printf '\n\n'; $@; printf '\n\n'
}

## Navigatin ##
alias \
    lsc='ls --color=always' \
    l='lwrap "ls -h --color=always"' \
    lsa='lwrap "ls -h --color=always -A"' \
    ll='lwrap "ls -h --color=always -lA"' \
    lt='exa --tree --level=2' \
    mount='mount | column -t' \
    del='mv --force -t ~/.Trash $@'

## Editors ##
alias \
    n='nvim' \
    N='sudo nvim' \
    v='vim' \
    V='sudo vim' \
    e='emacs -nw' \
    ec='emacsclient' \
    ed='emacs --daemon' \
    ped='prime-run emacs --daemon'
# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

## Packages ##
alias \
    p='pacman' \
    P='sudo pacman' \
    pkgs='pacman -Q | fzf'

## XDG ##
alias \
    units='units --history "$XDG_CACHE_HOME"/units_history' \
    nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

## Color ##
alias \
    grep='grep --color=auto' \
    fgrep='fgrep --color=auto' \
    egrep='egrep --color=auto' \
    diff='diff --color=auto' \
    ip="ip -color=auto"

## Defaults ##
alias \
    cp='cp -iv' \
    mv='mv -iv' \
    rm='rm -vi' \
    bc='bc -ql' \
    rsync='rsync -vpl' \
    mkd='mkdir -pv' \
    ffmpeg='ffmpeg -hide_banner' \
    # rsync='rsync -vrplu' 

## Tools ##
# Sync #
# Only sync files if newer #
alias upsync='rsync -auvh --progress'
# Sync without preserving metadata #
alias rrsync='rsync -rvh --progress'
# Sync preserving meta-data #
alias arcsync='rsync -ravh --progress'
# Compare two directories #
alias rdiff='rsync -avhn --progress'

# Alert #
# Add an "alert" alias for long running commands.  Use like so: $ sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Misc #
alias \
    fdiff='diff --brief --recursive' \
    hist='cat ~/.bash_history | fzf' \
    S='sudo "$BASH" -c "$(history -p !!)"' \
    pr="prime-run $@" \
    ds='du -h --max-depth=1' \
    torb='prime-run torbrowser-launcher'

# Wifi
wifiadd () {
nmcli device wifi connect $1 password $2
}

## Remote ##
alias cs='ssh max@Clean_System'
alias wcs="wol $cleansysmac"
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
