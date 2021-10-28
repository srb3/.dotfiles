#!/bin/zsh

set -u
set -o pipefail

function aur_install() {
	_target=$1
	repo=$2
    echo "=============== INSTALLING $repo ==============="
	git -C $_target clone "https://aur.archlinux.org/${repo}.git"
    if [ $? -eq 0 ]; then
        set -e
        echo "CLONED $repo"
	    cd "$_target/$repo"
	    makepkg -srcif
        echo "INSTALLED $repo"
        return 0
    else
        echo "FAILED TO INSTALL $repo"
        return 1
    fi
}

target="$HOME/apps"
aur_install $target i3lock-color
