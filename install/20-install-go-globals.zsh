#!/usr/bin/env zsh

set -e
set -u
set -o pipefail

echo "=============== INSTALLING GO PACKAGES ==============="
sleep 5

echo "=============== checking go ==============="
if [ $(command -v "go") ]; then
    echo "OKAY"
else
    echo "golang is not installed."
    echo "Install golang and try again."
    exit 1
fi

package_list=(
    "mvdan.cc/sh/v3/cmd/shfmt@latest"
    "github.com/mattn/efm-langserver@latest"
)

echo "=============== installing packages ==============="
for package in $package_list
do
    go install $package
done
