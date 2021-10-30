#!/usr/bin/env zsh

set -u
set -o pipefail

echo "=============== INSTALLING POETRY ==============="
sleep 5

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

check_shell
check_install
if [ $? -eq 1 ]; then
    _install
fi

poetry --version
