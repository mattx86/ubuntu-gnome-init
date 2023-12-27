#!/bin/bash

DISABLED_GNOME_EXTENSIONS="window-list|workspace-indicator"
ENABLED_GNOME_EXTENSIONS=$(ls -1 /usr/share/gnome-shell/extensions/ | egrep -v "$DISABLED_GNOME_EXTENSIONS" | sed -r -e "s;(.*);'\1',;" | tr -d '\n' | sed -re 's;^(.*),$;[\1];')
gsettings set org.gnome.shell enabled-extensions "$ENABLED_GNOME_EXTENSIONS"
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
gsettings set org.gnome.shell.extensions.user-theme name 'Yaru-dark'
gsettings set org.gnome.desktop.wm.preferences theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.shell disable-user-extensions false

export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export XDG_DATA_DIRS=/usr/share/ubuntu:/usr/share/gnome:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop
/etc/X11/Xsession

gnome-session
