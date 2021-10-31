#!/usr/bin/env zsh

set -u
set -o pipefail

language_servers=(
    typescript
    typescript-language-server
    pyright
    eslint_d
    vscode-langservers-extracted
    prettier
    dockerfile-language-server-nodejs
    bash-language-server
    yaml-language-server
)

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
    # nvm is a shell function only in zshrc so have to source that
    echo "=============== checking nvm ==============="
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    if [ $? -eq 0 ]; then
        echo "OKAY"
        echo "=============== installing latest node ==============="
        nvm install node
    else
        echo "nvm is not installed."
        echo "Install nvm and try again."
        exit 1
    fi
}

function install_modules() {
    echo "=============== installing language servers ==============="
    npm install -g ${language_servers[@]}
}

yes_or_no "Install node modules?"
if [ $? -eq 0 ]; then
    echo "=============== INSTALLING NPM GLOBALS ==============="
    sleep 5
    check_shell
    install_modules
fi
