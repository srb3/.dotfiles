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
    if [ -z $POETRY_HOME ]; then
        echo "Set 'POETRY_HOME' and try again."
        exit 1
    else
        echo "OKAY"
    fi
}

function check_install() {
    echo "=============== checking current installation ==============="
    if [ $(command -v "poetry") ]; then
        echo "Poetry is already installed!"
        echo "Update with 'poetry self update'"
    else
        echo "Poetry not installed."
        return 1
    fi
}

function _install() {
    echo "=============== running installer (UNSAFELY) ==============="
    curl -L https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
}

yes_or_no "Install poetry?"
if [ $? -eq 0 ]; then
    echo "=============== INSTALLING POETRY ==============="
    sleep 5
    check_shell
    check_install
    if [ $? -eq 1 ]; then
        _install
    fi
    poetry --version
fi
