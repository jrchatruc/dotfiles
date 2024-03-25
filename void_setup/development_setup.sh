#!/usr/bin/env bash

set -e

sudo xbps-install -y base-devel git zsh
chsh -s $(which zsh)

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git clone https://github.com/so-fancy/diff-so-fancy.git ~/.config/diff-so-fancy

sudo xbps-install -y eza neofetch neovim ripgrep fzf ctags direnv curl xsel

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim

sudo xbps-install -y vim firefox alsa-utils alsa-firmware apulse pulseaudio sof-firmware sof-tools mesa-vulkan-intel intel-video-accel
sudo ln -s /etc/sv/alsa /var/service

cp ../config/{.gitconfig,.gitignore_global,.psqlrc,.vimrc,.zpreztorc,.zshrc} ~/
cp ../config/aliases.zsh ~/.config/
cp ../config/nvim/init.vim ~/.config/nvim/

sudo cp -f i3status.conf /etc/i3status.conf
sudo cp -f config ~/.config/i3/config
