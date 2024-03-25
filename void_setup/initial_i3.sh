#!/usr/bin/env bash

set -e

xbps-install -Su
xbps-install -y xorg i3 i3status dbus lightdm lightdm-gtk-greeter alacritty elogind
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/lightdm /var/service
sudo ln -s /etc/sv/elogind /var/service
