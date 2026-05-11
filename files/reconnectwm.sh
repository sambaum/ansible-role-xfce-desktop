#!/bin/sh
# Restart the window manager if it crashed during the disconnected period.
# Without this, reconnecting to a session with a dead xfwm4 yields a frozen desktop.
pgrep -u "$USER" xfwm4 >/dev/null 2>&1 || { xfwm4 & sleep 1; }
pgrep -u "$USER" xfdesktop >/dev/null 2>&1 || xfdesktop &
