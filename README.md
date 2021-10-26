# Personal dotfiles

### Usage:
```
sudo pacman -S git
git clone https://github.com/stnley/.dotfiles.git
cd ~/.dotfiles/
./pacman/install.sh         # install arch packages
./bootstrap.zsh             # prepare home directory
./install.zsh               # install configs
./install-apps.zsh          # install packages from AUR, source, and others
```

### Maintenance:
When adding new configs, create the required directories. Then, add the base directory to `$STOW_FOLDERS`.

Afterwards, clean and reinstall.
```
./clean-env.zsh
./install.zsh
```