#!/bin/zsh

mkdir -p $HOME/.fonts
cp -f $DOTFILES/fonts/* $HOME/.fonts
fc-cache -f

