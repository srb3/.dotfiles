#!/bin/sh

userresources=$HOME/.Xresources

# merge in defaults and keymaps

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

# start some nice programs

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

udiskie --smart-tray &
exec i3
