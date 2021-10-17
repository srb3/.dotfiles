if [ -n "$DISPLAY" ]; then
    unset PURE_PROMPT_SYMBOL
else
    setfont "$DOTFILES/fonts/.fonts/ter-powerline-v20n.psf.gz"
    export PURE_PROMPT_SYMBOL=">"
fi
