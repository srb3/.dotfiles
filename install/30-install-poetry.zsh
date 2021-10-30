#!/usr/bin/env zsh

set -u
set -o pipefail

echo "=============== INSTALLING POETRY ==============="
sleep 5

echo "=============== checking shell ==============="
if [ -z $POETRY_HOME ]; then
    echo "Set 'POETRY_HOME' and try again."
    exit 1
else
    echo "OKAY"
fi

echo "=============== checking current installation ==============="
if [ $(command -v "poetry") ]; then
    echo "Poetry is already installed!"
    echo "Update with 'poetry self update'"
    exit 0
fi

echo "=============== running installer (UNSAFELY) ==============="
curl -L https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
poetry --version
