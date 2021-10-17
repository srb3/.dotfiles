if [ -n "$DISPLAY" ]; then
    unset PURE_PROMPT_SYMBOL
else
    export PURE_PROMPT_SYMBOL=">"

    # for some reason when running inside tmux, this throws error
    if [ "$TERM" != "tmux-256color" ]; then
        setfont "$DOTFILES/fonts/.fonts/ter-powerline-v20n.psf.gz"
    fi
fi
