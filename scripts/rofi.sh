#!/usr/bin/env bash

if pgrep -x "rofi" >/dev/null; then
  pkill "rofi"
else
  rofi -show drun
fi
