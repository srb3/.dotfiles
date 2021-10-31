#!/bin/zsh

set -u
set -o pipefail

function yes_or_no {
    while true; do
        read "?$* [y/n]: " yn
        case $yn in
            [Yy]*)
                return 0
                ;;
            [Nn]*)
                echo "Cancelled"
                return  1
                ;;
        esac
    done
}

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

yes_or_no "Install f5vpn?"
if [ $? -eq 0 ]; then
    target="$HOME/apps"
    aur_install $target f5vpn
fi
