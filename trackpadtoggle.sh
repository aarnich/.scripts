#!/bin/bash
if xinput list-props 13 | grep "Device Enabled (186):.*1" >/dev/null
then
  notify-send "Trackpad disabled"
  xinput disable 13
else
  xinput enable 13
  notify-send -u low -i mouse "Trackpad enabled"
fi
