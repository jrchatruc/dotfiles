#!/usr/bin/env bash

set -e

sudo xbps-install -Su
sudo xbps-install -y xorg i3 i3status dbus lightdm lightdm-gtk-greeter alacritty elogind dmenu
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/lightdm /var/service
sudo ln -s /etc/sv/elogind /var/service
