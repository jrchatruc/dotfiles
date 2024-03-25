#!/usr/bin/env bash

set -e
sudo -i

xbps-install -y base-devel git zsh
chsh -s $(which zsh)

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git clone https://github.com/so-fancy/diff-so-fancy.git "~/.config/"

xbps-install -y eza neofetch neovim ripgrep fzf ctags direnv

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir ~/.config/nvim

xbps-install -y vim firefox alsa-utils alsa-firmware apulse sof-firmware sof-tools
sudo ln -s /etc/sv/alsa /var/service

git clone https://github.com/jrchatruc/dotfiles.git
cp dotfiles/config/{.gitconfig,.gitignore_global,.psqlrc,.vimrc,zpreztorc,zshrc} ~/
cp dotfiles/config/aliases.zsh ~/.config/
cp dotfiles/config/nvim/init.vim ~/.config/nvim/

cp -f i3status.conf /etc/i3status.conf
cp -f config ~/.config/i3/config
