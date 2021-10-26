#!/usr/bin/env zsh
source ./zsh/.zshenv
pushd $DOTFILES
for folder in $STOW_FOLDERS
do
    echo "REMOVING $folder"
    stow -D $folder
done
popd
