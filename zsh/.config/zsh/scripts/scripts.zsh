pyclean() {
    find . -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
}


# fd - cd to selected directory
fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
}


# fda - including hidden directories
fda() {
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}


# ff - find a file and open it in your editor
ff() {
    if [ -n "${EDITOR+1}" ]; then
        editor="$EDITOR"
    else
        echo "No \$EDITOR set for session"
        return 1
    fi
    local file
    file=$(find ${1:-.} -type f 2> /dev/null | fzf +m) && "$editor" "$file"
}
