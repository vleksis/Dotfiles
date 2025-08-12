#!/usr/bin/env bash

if pgrep -x "rofi" >/dev/null; then
  pkill "rofi"
else
  cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy
fi
