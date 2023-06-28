#
# ~/.profile
#


# If running bash, source .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Paths
export PATH="$HOME/bin:$PATH"
export PATH="${PATH}:/$HOME/.local/bin"

# Default programs:
export EDITOR="emacs"
# export TERM='st'
export TERMINAL="st"
export TERMINAL_PROG="st"
export BROWSER="firefox"

# Setting XDG Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
# export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash-completion/bash_completion
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export AWT_TOOLKIT=MToolkit	# Java Window Sizing
# colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"
# export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
# export KODI_DATA="$XDG_DATA_HOME/kodi"
# export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
# export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
# export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
# export CARGO_HOME="$XDG_DATA_HOME/cargo"
# export GOPATH="$XDG_DATA_HOME/go"
# export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
# export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
# export UNISON="$XDG_DATA_HOME/unison"
export HISTFILE="$XDG_DATA_HOME/history"
# export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
# export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
# export gpg2 --homedir '$XDG_DATA_HOME'/gnupg
# export nvidia-settings --config='$XDG_CONFIG_HOME'/nvidia/settings

# Other Settings
# export DICS="/usr/share/stardict/dic/"
# export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export QT_QPA_PLATFORMTHEME="gtk2" # Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.
export AWT_TOOLKIT="MToolkit wmname LG3D" # May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for Java applications in dwm

# If in tty, startx
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi
