#!/bin/zsh

# Environment variables
export DOTFILES=$HOME/.dotfiles
export STOW_FOLDERS=(colorls fonts i3 nvim personal python tmux X11 zsh alacritty)
export LANG=en_US.UTF-8
export LESSHISTFILE=$XDG_CACHE_HOME/.lesshist

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZPROMPT="$XDG_CONFIG_HOME/zsh/prompt"
export HISTFILE="$XDG_CACHE_HOME/zsh/zhistory"
export HISTSIZE=1000
export SAVEHIST=1000

# golang
export GOROOT="$XDG_DATA_HOME/go"
export GOPATH="$HOME/personal/development/go"
export GOBIN="$GOPATH/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"

# ruby
export GEM_HOME="$XDG_DATA_HOME/ruby"
export GEM_PATH="$GEM_HOME/gems"

# rust
export RUSTUP_HOME="$XDG_DATA_HOME/.rustup"
export CARGO_HOME="$XDG_DATA_HOME/.cargo"

# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export POETRY_HOME="$XDG_DATA_HOME/.poetry"
export POETRY_BIN="$POETRY_HOME/bin"
export POETRY_CACHE_DIR="$XDG_CACHE_HOME/pypoetry"

# nvim
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

# nvm
export NVM_DIR="${XDG_CONFIG_HOME}/nvm"

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOBIN:$PATH"
export PATH="$POETRY_BIN:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"

# nvidia driver specific
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
