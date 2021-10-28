#!/bin/zsh

if [ "$(tty)" = "/dev/tty1" ]; then
	export QT_QPA_PLATFORMTHEME=qt5ct
	eval $(gnome-keyring-daemon --start)
	export SSH_AUTH_SOCK
	exec startx
fi
