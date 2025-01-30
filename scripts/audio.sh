#!/bin/bash

# Function to get the current volume

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}' | sed 's/Volume://g' | awk '{print $1 * 100}'
}

# Function to set the volume, with no cap for specific volume setting
set_volume() {
  local new_volume=$1
  
  if [[ $new_volume -lt 0 ]]; then
    new_volume=0
  fi

  wpctl set-volume @DEFAULT_AUDIO_SINK@ ${new_volume}%
}

change_volume() {
  local difference=$1
  local current_volume=$(get_volume)
  local new_volume=$((current_volume + difference))

  if [[ $new_volume -gt 100 ]]; then
    new_volume=100
  fi

  set_volume $new_volume
}

# Function to mute/unmute the audio
toggle_mute() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
}

# Function to display help message
usage() {
    echo "Usage: $0 [COMMAND] [ARGUMENTS]"
    echo "Commands:"
    echo "  increase               Increase volume by 5% (capped at 100%)"
    echo "  decrease               Decrease volume by 5%"
    echo "  mute                   Mute/unmute the audio"
    echo "  set [volume]           Set volume to specific value (no cap, e.g., 150%)"
    echo "  show                   Show the current volume"
    echo "  help                   Show this help message"
}

# Main script logic
case "$1" in
    change)
        if [[ -z "$2" ]]; then
            echo "Error: You must provide a volume level."
            exit 1
        fi
        change_volume $2
        ;;
    mute)
        toggle_mute
        ;;
    set)
        if [[ -z "$2" ]]; then
            echo "Error: You must provide a volume level."
            exit 1
        fi
        set_specific_volume $2
        ;;
    show)
        show_volume
        ;;
    help)
        usage
        ;;
    *)
        echo "Invalid command. Use 'help' for usage information."
        exit 1
        ;;
esac

