
if pgrep -x "neohtop" > /dev/null; then
  pkill neohtop
else
  neohtop
fi

