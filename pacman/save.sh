#!/bin/sh

script_dir=$(dirname $0)
save_file="${script_dir}/pkglist.txt"
echo "Saving package list to $save_file"

pacman -Qqe >$save_file