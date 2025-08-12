#!/usr/bin/env bash

# Function to convert signal strength (0-100) into bars.
create_bars() {
  local signal=$1
  # Calculate the number of bars (from 1 to 5).
  local bars=$(((signal * 5 + 50) / 100))
  local barStr=""
  case $bars in
    0) barStr="▯▯▯▯▯" ;;
    1) barStr="▮▯▯▯▯" ;;
    2) barStr="▮▮▯▯▯" ;;
    3) barStr="▮▮▮▯▯" ;;
    4) barStr="▮▮▮▮▯" ;;
    5) barStr="▮▮▮▮▮" ;;
    *) barStr="Error" ;;
  esac
  echo "$barStr"
}

# Get the first active (connected) device.
active_con=$(nmcli -t -f DEVICE,TYPE,STATE dev status | grep ":connected")
if [ -z "$active_con" ]; then
  echo "No active network connection"
  exit 0
fi

# Parse the active device, type and state.
IFS=':' read -r device type state <<<"$active_con"


if [ "$type" == "wifi" ]; then
  # Get WiFi details (SSID and signal strength) for the active connection.
  wifi_info=$(nmcli -t -f active,ssid,signal dev wifi | grep '^yes')
  ssid=$(echo "$wifi_info" | cut -d: -f2)
  signal=$(echo "$wifi_info" | cut -d: -f3)
  bars=$(create_bars "$signal")
  # Output with WiFi icon and signal bars.
  echo " WiFi: $ssid"
  echo "[$bars] ($signal%)"
else
  # For Ethernet, fetch the IPv4 address.
  ipaddr=$(ip -4 addr show "$device" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)
  echo " Ethernet: $ipaddr"
fi
