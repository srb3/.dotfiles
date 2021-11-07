#!/bin/zsh

#-----------------------
# general
#-----------------------
export LANG=en_US.UTF-8
export LESSHISTFILE=$XDG_CACHE_HOME/.lesshist
export DOTFILES=$HOME/.dotfiles
export STOW_FOLDERS=(alacritty
    bin
    colorls
    dunst
    fonts
    i3
    keepassxc
    nvim
    pacman
    personal
    powerline
    python
    ranger
    systemd
    themes
    tmux
    user-dirs
    vim
    X11
    zathura
    zsh
)


#-----------------------
# editor
#-----------------------
export EDITOR="vim"
export VISUAL="$EDITOR"


#-----------------------
# golang
#-----------------------
export GOROOT="$XDG_DATA_HOME/go"
export GOPATH="$HOME/personal/development/go"
export GOBIN="$GOPATH/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"


#-----------------------
# gpg
#-----------------------
export GNUPGHOME="$XDG_DATA_HOME/gnupg"


#-----------------------
# gtk
#-----------------------
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"


#-----------------------
# nvidia driver specific
#-----------------------
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"


#-----------------------
# nvm
#-----------------------
export NVM_DIR="$XDG_DATA_HOME/nvm"


#-----------------------
# python
#-----------------------
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export POETRY_HOME="$XDG_DATA_HOME/.poetry"
export POETRY_BIN="$POETRY_HOME/bin"
export POETRY_CACHE_DIR="$XDG_CACHE_HOME/pypoetry"


#-----------------------
# ruby
#-----------------------
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"


#-----------------------
# rust
#-----------------------
export RUSTUP_HOME="$XDG_DATA_HOME/.rustup"
export CARGO_HOME="$XDG_DATA_HOME/.cargo"


#-----------------------
# vim
#-----------------------
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'


#-----------------------
# XDG
#-----------------------
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache


#-----------------------
# zsh
#-----------------------
skip_global_compinit=1
export ZPROMPT="$XDG_CONFIG_HOME/zsh/prompt"
export HISTFILE="$XDG_CACHE_HOME/zsh/zhistory"
export HISTSIZE=1000
export SAVEHIST=1000


#-----------------------
# PATH
#-----------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="$GEM_HOME/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOBIN:$PATH"
export PATH="$POETRY_BIN:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"
