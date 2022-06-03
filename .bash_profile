#
# ~/.bash_profile
#

# Paths
export PATH="${PATH}:/$HOME/.local/bin"

# If in tty, startx
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc


