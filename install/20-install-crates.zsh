#!/usr/bin/env zsh

set -u
set -o pipefail

crate_list=(stylua)

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
    echo "=============== checking cargo ==============="
    if [ $(command -v "cargo") ]; then
        echo "OKAY"
    else
        echo "cargo is not installed."
        echo "Install Rust and try again."
        exit 1
    fi
}

function install_crates() {
    echo "=============== installing crates ==============="
    cargo install ${crate_list[@]}
}

yes_or_no "Install crates?"
if [ $? -eq 0 ]; then
    echo "=============== INSTALLING CRATES ==============="
    sleep 5
    check_shell
    install_crates
fi
