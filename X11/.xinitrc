#!/bin/sh

userresources=$HOME/.Xresources

# try to start docked.
# if no monitor is connected this command returns 1
external-monitor dock

# merge in defaults and keymaps

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

# start some nice programs

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

udiskie --smart-tray &
exec i3
