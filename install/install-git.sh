#!/bin/zsh

mkdir -p $XDG_CONFIG_HOME/git

ln -sf $DOTFILES/git/config $XDG_CONFIG_HOME/git
ln -sf $DOTFILES/git/git-personal.conf $XDG_CONFIG_HOME/git
ln -sf $DOTFILES/git/git-work.conf $XDG_CONFIG_HOME/git

