#!/bin/sh

userresources=$HOME/.Xresources

# merge in defaults and keymaps

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

# start some nice programs

udiskie --smart-tray &
exec i3
