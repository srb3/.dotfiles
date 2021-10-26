#!/usr/bin/env zsh
source ./zsh/.zshenv
pushd $DOTFILES
for folder in $STOW_FOLDERS
do
    echo "CREATING $folder"
    stow $folder
done
popd
