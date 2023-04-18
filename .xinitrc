#!/bin/sh

# this file is run when calling startx
# default arch init scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*.sh; do
        [ -x "$f" ] && source "$f"
    done
    unset f
fi

# user init scripts and settings.
dbus-update-activation-environment --systemd --all
systemctl --user import-environment DISPLAY

# personal startup services
systemctl --user start Xsession.target &

# These guys are environment variables.
[ -f "$MODMAP" ] && xmodmap "$MODMAP"
[ -f "$RESOURCES_FILE" ] && xrdb -load "$RESOURCES_FILE"

# more stuff (personal scripts).
xset s off -dpms
xset r rate 350 70
urxvtd -q -o -f &
numlockx on &
#pcmanfm -d &
autostart &

# launch the session, commands below these lines will be ignored
# ONLY APPLIES TO ZSH
# Starting Xsession depending on tty when multiple wm are installed.
# If you want to use this way for login, uncomment the case statement,
# and remove the last line of this file.
# refers to $HOME/.config/zsh/.zlogin
#case $(tty | cut -b9-) in
#    (1) exec bspwm  ;;
#    (2) exec i3     ;;
#    (3) exec /usr/local/bin/dk > ~/.config/dk/debbug.log ;;
#esac
