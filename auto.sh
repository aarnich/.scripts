#!/bin/sh
xrandr --output HDMI-0 --mode 1920x1080 --rate 144.0
# STATE=$(xrandr --listproviders | head -1 | grep -Po "\\d+")
# if [[ $STATE = "2" ]]; then
#   sudo cp /etc/X11/xorg.conf.backup /etc/X11/xorg.conf
#   sudo systemctl restart display-manager
# fi
