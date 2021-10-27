#!/bin/zsh

#-----------------------
# options
#-----------------------
setopt autocd
setopt extendedglob
unsetopt beep


#-----------------------
# aliases
#-----------------------
source $DOTFILES/aliases/aliases


#-----------------------
# scripts
#-----------------------
for file ($XDG_CONFIG_HOME/zsh/scripts/*.zsh) source $file


#-----------------------
# prompt
#-----------------------
fpath=($ZPROMPT $fpath)
autoload -U promptinit; promptinit
zstyle :prompt:pure:prompt:success color green
prompt pure


#-----------------------
# keybindings
#-----------------------
bindkey -v
bindkey '^[[Z' autosuggest-accept


#-----------------------
# completion
#-----------------------
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d--%f'
zstyle ':completion:*:*:*:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit; compinit -d $XDG_CACHE_HOME/.zcompdump


#-----------------------
# autosuggestions
#-----------------------
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
source $XDG_CONFIG_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


#-----------------------
# fzf
#-----------------------
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
    export FZF_DEFAULT_OPTS=" \
        --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 \
        --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 \
        --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 \
        --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
fi


#-----------------------
# node
#-----------------------
