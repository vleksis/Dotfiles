#!/usr/bin/env bash
# Requirements: acpi

battery_info=$(acpi -b)
if [ -z "$battery_info" ]; then
  echo "No battery info available"
  exit 1
fi

state=$(echo "$battery_info" | awk -F': ' '{print $2}' | awk -F', ' '{print $1}')
capacity=$(echo "$battery_info" | grep -o '[0-9]\+%' | tr -d '%')

ac_adapter=$(acpi -a)
ac_status=$(echo "$ac_adapter" | awk -F': ' '{print $2}')

icon=""
if [[ "$state" == "Charging" ]]; then
  icon=""
elif [[ "$ac_status" == "on-line" ]]; then
  icon=""
else
  if [ "$capacity" -le 20 ]; then
    icon=""
  elif [ "$capacity" -le 40 ]; then
    icon=""
  elif [ "$capacity" -le 60 ]; then
    icon=""
  elif [ "$capacity" -le 80 ]; then
    icon=""
  else
    icon=""
  fi
fi

# Output the battery status in the desired format
echo "${capacity}% ${icon}"
