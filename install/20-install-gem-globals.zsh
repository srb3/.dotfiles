#!/usr/bin/env zsh

set -u
set -o pipefail

gem_list=(colorls)

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
    echo "=============== checking ruby ==============="
    if [ $(command -v "gem") ]; then
        echo "OKAY"
    else
        echo "gem is not installed."
        echo "Install ruby and try again."
        exit 1
    fi
}

function install_gems() {
    echo "=============== installing gems ==============="
    gem install ${gem_list[@]}
}

yes_or_no "Install gems?"
if [ $? -eq 0 ]; then
    echo "=============== INSTALLING GEMS ==============="
    sleep 5
    install_gems
fi
