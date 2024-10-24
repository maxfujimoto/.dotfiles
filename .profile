#
# ~/.profile
#

# The second profile file sourced by most shells

# Paths
export PATH="$HOME/bin:$PATH"
export PATH="${PATH}:/$HOME/.local/bin"
export PATH="${PATH}:/$HOME/.local/bin/Aliases"
export PATH="${PATH}:/$HOME/.local/bin/StatusBar"
# export DICS="/usr/share/stardict/dic/"

# Default Programs
export EDITOR="nvim"
export TERMINAL="st"
export TERMINAL_PROG="st"
export BROWSER="firefox"


# XDG Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_STATE_HOME="$HOME/.local/state"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export HISTFILE="$XDG_DATA_HOME/history"
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME/bash-completion/bash_completion"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
# export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"
# export gpg2 --homedir '$XDG_DATA_HOME'/gnupg
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
# export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
# export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
# export KODI_DATA="$XDG_DATA_HOME/kodi"
# export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
# export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
# export UNISON="$XDG_DATA_HOME/unison"
# export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
# export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
# export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
# export OLLAMA_MODELS="$XDG_DATA_HOME/ollama/models"

# Default Settings
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# Colors
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export LESS="R"
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
export LESS_TERMCAP_ue=$'\e[0m'
export GROFF_NO_SGR=1

# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# # Graphics
export MESA_VK_DEVICE_SELECT="10de:1290"
# export LD_BIND_NOW=1		# preload shared libs for games Breaks Reaper
export GAMEMODERUNEXEC='prime-run'
export QT_QPA_PLATFORMTHEME='gtk3' # Have QT use gtk3 theme.
# export QT_QPA_PLATFORMTHEME=qt5ct:qt6ct # Use qt5ct theme
# export  XDG_CURRENT_DESKTOP='GNOME'	# Force qt apps to read gnome theme
export AWT_TOOLKIT='MToolkit wmname LG3D' # May have to install wmname arduino ide fix
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for Java applications in dwm

# Input
export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.
export XKB_DEFAULT_LAYOUT='us'
export XKB_DEFAULT_VARIANT=''
# export XKB_DEFAULT_OPTIONS='caps:ctrl,escape:caps,ctrl:alt,alt:escape'
export XKB_DEFAULT_OPTIONS=''


# Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
    return 0
fi

# If running bash, source .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# If in tty1, startx/startw
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
    # startw one day?
fi
