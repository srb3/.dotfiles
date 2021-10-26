#!/usr/bin/env zsh

set -u
set -o pipefail

echo "=============== INSTALLING CRATES ==============="
sleep 5

echo "=============== checking cargo ==============="
if [ $(command -v "cargo") ]; then
    echo "OKAY"
else
    echo "cargo is not installed."
    echo "Install Rust and try again."
    exit 1
fi

crate_list=(stylua)

echo "=============== installing crates ==============="
cargo install ${crate_list[@]}
