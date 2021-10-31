#!/bin/zsh

set -u
set -o pipefail

target="$HOME/apps"

function yes_or_no {
    while true; do
        read "?$* [y/n]: " yn
        case $yn in
            [Yy]*)
                return 0
                ;;
            [Nn]*)
                echo "Cancelled"
                return  1
                ;;
        esac
    done
}

function install_deps() {
    echo "=============== installing dependencies ==============="
    sudo pacman -S --needed base-devel git linux-headers
}

function aur_install() {
	_target=$1
	repo=$2
    if [ -d "$_target/$repo" ]; then
        echo "$repo already found."
    else
        echo "=============== INSTALLING $repo ==============="
        git -C $_target clone "https://aur.archlinux.org/${repo}.git"
        echo "CLONED $repo"
    fi

    if [ $? -eq 0 ]; then
        set -e
	    cd "$_target/$repo"
        git pull
	    makepkg -srcif --needed
        echo "INSTALLED $repo"
        return 0
    else
        echo "FAILED TO INSTALL $repo"
        return 1
    fi
}

function setup_firmare_daemon() {
    set -e
    sudo systemctl enable --now system76-firmware-daemon
    sudo gpasswd -a $USER adm
    echo "=============== firmware-daemon enabled ==============="
}

function setup_driver() {
    set -e
    sudo systemctl enable --now system76
    echo "=============== driver enabled ==============="
}

function setup_power() {
    set -e
    sudo systemctl enable --now system76-power
    sudo gpasswd -a $USER adm
    echo "=============== power enabled ==============="
}


yes_or_no "Install System76 software? (you can choose to install individual applications)"
if [ $? -eq 0 ]; then
    echo "=============== INSTALLING SYSTEM76 SOFTWARE ==============="
    sleep 5

    install_deps

    yes_or_no "Install system76-firmware?"
    if [ $? -eq 0 ]; then
        aur_install $target system76-firmware && setup_firmare_daemon
    fi

    yes_or_no "Install system76-driver?"
    if [ $? -eq 0 ]; then
        aur_install $target system76-driver && setup_power
    fi
    yes_or_no "Install firmware-manager?"
    if [ $? -eq 0 ]; then
        aur_install $target firmware-manager
    fi

    yes_or_no "Install open-firmware drivers?"
    if [ $? -eq 0 ]; then
        aur_install $target system76-acpi-dkms
    fi

    yes_or_no "Install system76-power?"
    if [ $? -eq 0 ]; then
        aur_install $target system76-power && setup_power
    fi

    echo "=============== FINISHED SYSTEM76 SOFTWARE ==============="
fi
