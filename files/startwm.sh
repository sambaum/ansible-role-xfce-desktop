#!/bin/sh
# /etc/xrdp/startwm.sh – simplified for persistent Xfce sessions

unset DBUS_SESSION_BUS_ADDRESS
unset XDG_RUNTIME_DIR

# Source environment
[ -r /etc/profile ] && . /etc/profile
[ -r ~/.profile ] && . ~/.profile

# Start or reuse Xfce
exec startxfce4

