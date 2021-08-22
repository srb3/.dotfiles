#!/bin/zsh

# options
setopt autocd
setopt extendedglob
unsetopt beep

# aliases
source $DOTFILES/aliases/aliases

# prompt
fpath=($ZPROMPT $fpath)
autoload -U promptinit; promptinit
zstyle :prompt:pure:prompt:success color green
prompt pure

# keybindings
bindkey -v

# completion
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d--%f'
zstyle ':completion:*:*:*:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit; compinit

# autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
bindkey '^ ' autosuggest-accept
source $XDG_CONFIG_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# node version manager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
