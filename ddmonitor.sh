#!/bin/bash
STATE=$(xrandr --listproviders | head -1 | grep -Po "\\d+")
if [[ $STATE = "2" ]]; then

  sudo cp /etc/X11/xorg.conf /etc/X11/xorg.conf.PRIMEBACKUP
  sudo cp /etc/X11/xorg.conf.backup /etc/X11/xorg.conf
  sudo systemctl restart display-manager
fi
if [[ $STATE = "1" ]]; then
  sudo cp /etc/X11/xorg.conf /etc/X11/xorg.conf.backup
  sudo cp /etc/X11/xorg.conf.PRIMEBACKUP /etc/X11/xorg.conf
  sudo systemctl restart display-manager
fi
