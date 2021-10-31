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
    if [ -z $RUSTUP_HOME ]; then
        echo "Set 'RUSTUP_HOME' and try again."
        exit 1
    else
        echo "OKAY"
    fi
}

function check_install() {
    echo "=============== checking current installation ==============="
    if [ $(command -v "rustup") ]; then
        echo "Rustup is already installed!"
        echo "Update with 'rustup self update'"
    else
        echo "rustup not installed"
        return 1
    fi
}

function _install() {
    echo "=============== running installer (UNSAFELY) ==============="
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path
}


yes_or_no "Install rust?"
if [ $? -eq 0 ]; then
    echo "=============== INSTALLING RUST ==============="
    sleep 5
    check_shell
    check_install
    if [ $? -eq 1 ]; then
        _install
    fi
fi
