#!/bin/zsh

if [ "$(tty)" = "/dev/tty1" ]; then
	eval $(gnome-keyring-daemon --start)
	export SSH_AUTH_SOCK
	exec startx
fi
