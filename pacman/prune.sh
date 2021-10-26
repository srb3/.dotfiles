#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
	echo "This must be run by root" >&2
	exit 1
fi

script_dir=$(dirname $0)
save_file="${script_dir}/pkglist.txt"

pacman -Rsu $(comm -23 <(pacman -Qq | sort) <(sort $save_file))
