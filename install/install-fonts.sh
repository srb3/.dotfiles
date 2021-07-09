#!/bin/bash

mkdir -p $XDG_DATA_HOME/fonts
cp -f $DOTFILES/fonts/* $XDG_DATA_HOME/fonts
fc-cache -f

