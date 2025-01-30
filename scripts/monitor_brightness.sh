#!/bin/bash

# Function to get the current brightness as a percentage
get_brightness() {
    local current_brightness=$(brightnessctl g)  # Get current brightness value
    echo $current_brightness
}

# Function to set the brightness to a specific value (0-100)
set_brightness() {
    local value=$1
    
    if [[ $value -lt 10 ]]; then
        value=10
    fi

    if [[ $value -gt 100 ]]; then
        value=100
    fi

    brightnessctl s "${value}%"  # Set brightness as a percentage (0-100)
}

# Function to increase brightness by a specific value (default: 5%)
change() {
    local difference=$1
    local current_brightness=$(get_brightness)
    local new_brightness=$((current_brightness + difference))
    
    set_brightness $new_brightness
}

# Main script logic
case "$1" in
    change)
        if [[ -z "$2" ]]; then
            echo "Error: You must provide a brightness value (0-100)."
        else
           change $2
        fi
        ;;
    set)
        if [[ -z "$2" ]]; then
            echo "Error: You must provide a brightness value (0-100)."
            exit 1
        fi
        set_brightness $2
        ;;
    *)
        echo "Invalid command." 
        exit 1
        ;;
esac

