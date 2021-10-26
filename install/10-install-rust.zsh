#!/usr/bin/env zsh

set -u
set -o pipefail

echo "=============== checking shell ==============="
if [ -z $RUSTUP_HOME ]; then
    echo "Set 'RUSTUP_HOME' and try again."
    exit 1
else
    echo "OKAY"
fi

echo "=============== running installer (UNSAFELY) ==============="
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path
