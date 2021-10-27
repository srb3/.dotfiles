#!/usr/bin/env zsh

# would be nice if this was more dynamic based off of user-dirs

home_dirs=(apps personal work .local)
personal="$HOME/personal"
personal_dirs=(documents music pictures videos)

# create home directories
echo "CREATING HOME DIRS"
cd $HOME
mkdir ${home_dirs[@]}

# create xdg directories
echo "CREATING XDG DIRS"
cd $personal
mkdir ${personal_dirs[@]}
mkdir "${personal}/documents/templates"
