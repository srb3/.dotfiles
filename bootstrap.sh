#!/usr/bin/env zsh

# would be nice if this was more dynamic based off of user-dirs

home_dirs=(apps personal work)
personal="$HOME/personal"
personal_dirs=(documents music pictures videos)

# create home directories
for dir in $home_dirs
do
	echo "CREATING ${HOME}/${dir}"
	mkdir "${HOME}/${dir}"
done

# create xdg directories
for dir in $personal_dirs
do
	echo "CREATING ${personal}/${dir}"
	mkdir "${personal}/${dir}"
done

echo "CREATING ${personal}/documents/templates"
mkdir "${personal}/documents/templates"

