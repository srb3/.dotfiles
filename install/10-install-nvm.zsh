#!/usr/bin/env zsh

set -u
set -o pipefail

function install_nvm() {
    target=$1
    echo "=============== cloning repo ==============="
    git clone https://github.com/nvm-sh/nvm.git $target
    cd $target
    echo "=============== checking out latest release ===============" &&
    git fetch --tags origin &&
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
}

function verify_nvm() {
    if [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; then
        echo "INSTALLED nvm"
        exit 0
    else
        echo "Something went wrong."
        exit 1
    fi
}

echo "=============== checking shell ==============="
if [ -z $NVM_DIR ]; then
    echo "Set 'NVM_DIR' and try again."
    exit 1
else
    echo "OKAY"
fi

install_nvm $NVM_DIR
if [ $? -eq 0 ]; then
    verify_nvm
else
    echo "Something went wrong."
    exit 1
fi
