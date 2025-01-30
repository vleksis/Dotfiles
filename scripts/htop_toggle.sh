
if pgrep -x "htop" > /dev/null; then
  pkill htop
else
  kitty htop
fi

