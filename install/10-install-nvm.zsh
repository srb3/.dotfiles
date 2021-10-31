#!/usr/bin/env zsh

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

function check_shell() {
    echo "=============== checking shell ==============="
    if [ -n $NVM_DIR ]; then
        echo "OKAY"
    else
        echo "Set 'NVM_DIR' and try again."
        exit 1
    fi
}

function install_nvm() {
    target=$1
    if [ -d "$target" ]; then
        echo "nvm already found."
    else
        echo "=============== cloning repo ==============="
        git clone https://github.com/nvm-sh/nvm.git $target
    fi

    cd $target

    echo "=============== switching to main  ==============="
    git checkout master && git pull && git fetch --tags

    echo "=============== checking out latest release ===============" &&
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
}

function verify_nvm() {
    if [ -f "$NVM_DIR/nvm.sh" ]; then
        echo "INSTALLED nvm"
    else
        echo "Something went wrong."
        exit 1
    fi
}

yes_or_no "Install nvm?"
if [ $? -eq 0 ]; then
    echo "=============== INSTALLING NVM ==============="
    sleep 5
    check_shell
    install_nvm $NVM_DIR
    if [ $? -eq 0 ]; then
        verify_nvm
    else
        echo "Something went wrong."
        exit 1
    fi
fi
