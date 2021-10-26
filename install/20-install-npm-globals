#!/usr/bin/env zsh

set -u
set -o pipefail

# nvm is a shell function only in zshrc so have to source that
echo "=============== checking nvm ==============="
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if [ $? -eq 0 ]; then
    echo "OKAY"
    echo "=============== installing latest node ==============="
    nvm install node
    echo $?
else
    echo "nvm is not installed."
    echo "Install nvm and try again."
    exit 1
fi


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

echo "=============== installing language servers ==============="
npm install -g ${language_servers[@]}
