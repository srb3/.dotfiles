#!/usr/bin/env zsh

set -u
set -o pipefail

target="$HOME/apps"

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

function install_deps() {
    echo "=============== install dependencies ==============="
    sudo pacman -S base-devel cmake unzip ninja tree-sitter curl --needed
}

function download_neovim() {
    _target=$1

    if [ -d "$_target" ]; then
        echo "neovim already found."
    else
        echo "=============== cloning repo ==============="
        git clone https://github.com/neovim/neovim $_target
    fi

    cd $_target

    echo "=============== switching to main  ==============="
    git checkout master && git pull && git fetch --tags --force

    echo "=============== checking out nightly ==============="
    git checkout nightly
}

function build_neovim() {
    _target=$1
    cd $_target
    echo "=============== building neovim ==============="
    make -j$(nproc)
    echo "=============== installing neovim ==============="
    sudo make install
}

yes_or_no "Install neovim nightly?"
if [ $? -eq 0 ]; then
    echo "=============== INSTALLING NEOVIM ==============="
    sleep 5
    download_neovim "$target/neovim"
    build_neovim "$target/neovim"
fi
