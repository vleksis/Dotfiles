#!/bin/bash

# Check if 'jq' is installed
if ! command -v jq &>/dev/null; then
  echo "Error: 'jq' is required but not installed. Please install it first."
  exit 1
fi

# Get the floating state of the active window
floating=$(hyprctl activewindow -j | jq -r ".floating")

# Define the desired size as percentages
width=$1
height=$2

# Function to resize and center the window
resize_and_center() {
  hyprctl dispatch resizeactive exact "$width" "$height"
  hyprctl dispatch centerwindow 1
}

hyprctl dispatch togglefloating
if [ "$floating" == "false" ]; then
  resize_and_center
fi
