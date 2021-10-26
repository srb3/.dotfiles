#!/usr/bin/env zsh

set -u
set -e
set -o pipefail

echo "=============== INSTALLING NEOVIM ==============="
sleep 5

target="$HOME/apps"

echo "=============== install dependencies ==============="
sudo pacman -S base-devel cmake unzip ninja tree-sitter curl --needed


function download_neovim() {
    _target=$1

    if [ -d "$_target" ]; then
        echo "neovim Already found"
    else
        echo "=============== cloning repo ==============="
        git clone https://github.com/neovim/neovim $_target
    fi

    cd $_target

    echo "=============== switching to main  ==============="
    git checkout master && git pull && git fetch --tags

    echo "=============== checking out nightly ==============="
    git checkout nightly
}


function build_neovim() {
    _target=$1
    cd $_target
    echo "=============== building neovim ==============="
    make -j4
    echo "=============== installing neovim ==============="
    sudo make install
}

download_neovim "$target/neovim"
build_neovim "$target/neovim"
