#!/bin/zsh

set -u
set -o pipefail

# dependencies
echo "=============== installing dependencies ==============="
sudo pacman -S --needed base-devel git linux-headers


target="$HOME/apps"

# aur install
function aur_install() {
	_target=$1
	repo=$2
    echo "=============== installing $repo ==============="
	git -C $_target clone "https://aur.archlinux.org/${repo}.git"
    if [ $? -eq 0 ]; then
        set -e
        echo "CLONED $repo"
	    cd "$_target/$repo"
	    makepkg -srcif
        echo "INSTALLED $repo"
        return 0
    else
        echo "FAILED TO INSTALL $repo"
        return 1
    fi
}


# firmware-daemon
function setup_firmare_daemon() {
    set -e
    sudo systemctl enable --now system76-firmware-daemon
    sudo gpasswd -a $USER adm
    echo "=============== firmware-daemon enabled ==============="
}

aur_install $target system76-firmware
if [ $? -eq 0 ]; then
    setup_firmare_daemon
fi


# driver
function setup_driver() {
    set -e
    sudo systemctl enable --now system76
    echo "=============== driver enabled ==============="
}

aur_install $target system76-driver
if [ $? -eq 0 ]; then
    setup_driver
fi


# firmware-manager
aur_install $target firmware-manager


# open-firmware acpi dkms
aur_install $target system76-acpi-dkms

# power manager
function setup_power() {
    set -e
    sudo systemctl enable --now system76-power
    sudo gpasswd -a $USER adm
    echo "=============== power enabled ==============="
}

aur_install $target system76-power
if [ $? -eq 0 ]; then
    setup_power
fi
