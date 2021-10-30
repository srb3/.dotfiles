#!/bin/zsh

set -u
set -o pipefail

function aur_install() {
	_target=$1
	repo=$2
    if [ -d "$_target/$repo" ]; then
        echo "$repo already found."
    else
        echo "=============== INSTALLING $repo ==============="
        git -C $_target clone "https://aur.archlinux.org/${repo}.git"
        echo "CLONED $repo"
    fi

    if [ $? -eq 0 ]; then
        set -e
	    cd "$_target/$repo"
        git pull
	    makepkg -srcif --needed
        echo "INSTALLED $repo"
        return 0
    else
        echo "FAILED TO INSTALL $repo"
        return 1
    fi
}

target="$HOME/apps"
aur_install $target i3lock-color
