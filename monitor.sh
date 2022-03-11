#!/bin/bash
MONITOR=$(xrandr --listmonitors | grep -oE '[^ ]+$' | tail -1)
if [[ $MONITOR = "eDP1" ]]; then
  xrandr --output DP1 --mode 1920x1080 --rate 119.99
  xrandr --output eDP1 --off
else
  xrandr --output eDP1 --auto 
  xrandr --output DP1 --off
fi
