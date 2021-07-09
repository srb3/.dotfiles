#!/bin/bash

mkdir -p $XDG_CONFIG_HOME/X11

ln -sf $DOTFILES/X11/xresources $XDG_CONFIG_HOME/X11/xresources
ln -sf $DOTFILES/X11/xprofile $HOME/.xprofile

