#!/bin/zsh
# ~/.zshenv

# Setting our path
[ -d "$HOME"/.local/bin ] && PATH="$HOME/.local/bin:$PATH"
[ -d /usr/sbin ] && PATH="$PATH:/usr/sbin"
[ -d /sbin ] && PATH="$PATH:/sbin"

#if [ -n "$(pidof nvidia-persistenced)" ]; then
#    export MONITOR1="DVI-D-0"
#    export MONITOR2="HDMI-0"
#    export MONITOR3="DP-0"
#else
#    export MONITOR1="DVI-D-1"
#    export MONITOR2="HDMI-1"
#    export MONITOR3="DP-1"
#fi

# Desktop & directories.
export XDG_CACHE_HOME="$HOME/.cache/"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share/"
export XDG_RUNTIME_DIR="/run/user/1000"
export XDG_STATE_HOME="$HOME/.local/state"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export SCRIPTDIR="$HOME/.local/bin"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Default programs.
export BROWSER="firefox"
export EDITOR="geany"
export MANPAGER="less"
export MIXER="pulsemixer"
export PAGER="less"
export READER="zathura"
export TERMINAL="urxvtc"
export VISUAL="vim"

# Configs & files.
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/keyring/ssh
export BSPWM_SOCKET="$XDG_RUNTIME_DIR"/bspwm_0_0-socket
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export LESSHISTFILE="-"
export MANWIDTH=100
export MODMAP="$XDG_CONFIG_HOME"/xfiles/Xmodmap
export NANORC_FILE="$XDG_CONFIG_HOME"/nano/nanorc
export RESOURCES_FILE="$HOME"/.Xresources
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd-socket
export SXHKD_FIFO="$XDG_RUNTIME_DIR"/sxhkd.fifo
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XCURSOR_PATH="${XCURSOR_PATH}:~/.local/share/icons"
export W3M_DIR="$XDG_CONFIG_HOME/w3m"
