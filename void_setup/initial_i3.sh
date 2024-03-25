#!/usr/bin/env bash

set -e
sudo -i

xbps-install -Su
xbps-install -y xorg i3 i3status dbus lightdm lightdm-gtk-greeter alacritty elogind
ln -s /etc/sv/dbus /var/service
ln -s /etc/sv/lightdm /var/service
ln -s /etc/sv/elogind /var/service
