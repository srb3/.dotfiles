#!/usr/bin/env zsh

set -u
set -o pipefail

VERSION="1.17.2"

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
    if [ -z $GOROOT ]; then
        echo "Set 'GOROOT' and try again."
        exit 1
    else
        echo "OKAY"
    fi
}

function check_install() {
    echo "=============== checking current installation ==============="
    if [ -e $(command -v go) ] &&
        [ $(go version | awk '/go/ {print $3}') = "go$VERSION" ]; then
            echo "Current installation up to date!"
        else
            echo "golang not installed or out of date"
            return 1
    fi
}

function remove_old() {
    echo "=============== removing old install ==============="
    rm -rf $GOROOT
    echo "OKAY"
}

function download() {
    echo "=============== downloading archive ==============="
    mkdir tmp
    cd tmp
    curl -L "https://golang.org/dl/go$VERSION.linux-amd64.tar.gz" -o go1.17.2.linux-amd64.tar.gz
    echo "OKAY"
}


function extract() {
    echo "=============== extracting archive ==============="
    tar -C $(dirname "$GOROOT") -xzf go1.17.2.linux-amd64.tar.gz
    cd ..
    rm -rf tmp
    echo "OKAY"
    go version
}

yes_or_no "Install golang?"
if [ $? -eq 0 ]; then
    echo "=============== INSTALLING GOLANG ==============="
    sleep 5
    check_shell
    check_install
    if [ $? -eq 1 ]; then
        remove_old
        download
        extract
    fi
fi

