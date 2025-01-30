
if pgrep -x "pavucontrol" > /dev/null; then
  killall pavucontrol
else
  pavucontrol &
fi

