#!/usr/bin/env zsh

set -u
set -o pipefail

package_list=(
    "mvdan.cc/sh/v3/cmd/shfmt@latest"
    "github.com/mattn/efm-langserver@latest"
)

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
    echo "=============== checking go ==============="
    if [ $(command -v "go") ]; then
        echo "OKAY"
    else
        echo "golang is not installed."
        echo "Install golang and try again."
        exit 1
    fi
}

function install_packages() {
    echo "=============== installing packages ==============="
    for package in $package_list
    do
        go install $package
    done
}

yes_or_no "Install go packages?"
if [ $? -eq 0 ]; then
    echo "=============== INSTALLING GO PACKAGES ==============="
    sleep 5
    check_shell
    install_packages
fi
