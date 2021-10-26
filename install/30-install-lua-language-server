#!/usr/bin/env zsh

set -u
set -o pipefail

target="$HOME/apps"

echo "=============== install dependencies ==============="
sudo pacman -S ninja --needed


function download_sumneko() {
    _target=$1

    echo "=============== cloning repo ==============="
    git clone https://github.com/sumneko/lua-language-server $_target
    cd $_target

    echo "=============== updating submodules  ==============="
    git submodule update --init --recursive

    echo "=============== checking out latest release ==============="
    git fetch --all --tags &&
    git checkout `git describe --abbrev=0 --tags --match "[0-9]*" $(git rev-list --tags --max-count=1)`
}


function build_sumneko() {
    _target=$1
    cd $_target
    echo "=============== installing server ==============="
    cd 3rd/luamake
    ./compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild
}


function verify_sumneko() {
    _target=$1
    full_path="$_target/bin/Linux/lua-language-server"
    echo "$full_path"
    if [ -e "$full_path" ]; then
        echo "OKAY"
    else
        echo "Looks like it didn't work."
        echo "Try installing again."
        exit 1
    fi
}


download_sumneko "$target/lua-language-server"
build_sumneko "$target/lua-language-server"
verify_sumneko "$target/lua-language-server"
