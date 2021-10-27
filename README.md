# Personal dotfiles

### Usage:
```
sudo pacman -S git
git clone https://github.com/stnley/.dotfiles.git
cd ~/.dotfiles/
git submodule update --init --recursive
./pacman/install.sh         # install arch packages
./bootstrap.zsh             # prepare home directory
./install-apps.zsh          # install packages from AUR, source, and others
./install.zsh               # install configs
```

### Maintenance:
After adding new packages with pacman:
```
./pacman/save.sh
```

When adding new configs, create the required directories. Then, add the base directory to `$STOW_FOLDERS`.

Afterwards, clean and reinstall:
```
./clean-env.zsh
./install.zsh
```

### Additional steps
On a fresh install, a few things need to happen.

#### Enable bluetooth
*enable* will make it start every login, *start* will just be for a session.
```
sudo systemctl enable|start bluetooth
```

#### gnome-keyring PAM step
see details here: [GNOME/Keyring](https://wiki.archlinux.org/title/GNOME/Keyring#PAM_step)

(add highlighted lines)
```
/etc/pam.d/login
---
#%PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
*auth       optional     pam_gnome_keyring.so*
account    include      system-local-login
session    include      system-local-login
*session    optional     pam_gnome_keyring.so auto_start*
```
