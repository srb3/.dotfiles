#!/usr/bin/env zsh
source ./zsh/.zshenv
for file ($DOTFILES/install/*.zsh) source $file
