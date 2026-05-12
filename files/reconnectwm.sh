#!/bin/sh
# Kill stale xrdp process if its TCP send queue is backed up (client went to
# sleep without disconnecting). The new xrdp process will then grab the
# display socket and the session becomes visible.
display_num=$(echo "$DISPLAY" | grep -oE '[0-9]+' | head -1)
sudo /usr/local/sbin/kill-stale-xrdp "$display_num"

# Restart the window manager if it crashed during the disconnected period.
# Without this, reconnecting to a session with a dead xfwm4 yields a frozen desktop.
pgrep -u "$USER" xfwm4 >/dev/null 2>&1 || { xfwm4 & sleep 1; }
pgrep -u "$USER" xfdesktop >/dev/null 2>&1 || xfdesktop &
