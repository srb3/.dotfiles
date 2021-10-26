#!/usr/bin/env zsh

set -u
set -o pipefail

echo "=============== checking ruby ==============="
if [ $(command -v "gem") ]; then
    echo "OKAY"
else
    echo "gem is not installed."
    echo "Install ruby and try again."
    exit 1
fi

gem_list=(colorls)

echo "=============== installing gems ==============="
gem install ${gem_list[@]}
