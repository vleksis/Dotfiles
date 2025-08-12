#!/bin/bash

if [[ "$1" == "exit" ]]; then
    echo ":: Exit"
    if [[ -f "$FILE" ]]; then
        rm $FILE
    fi
    sleep 0.5
    killall -9 Hyprland
    sleep 2
fi

if [[ "$1" == "lock" ]]; then
    echo ":: Lock"
    sleep 0.5
    hyprlock
fi

if [[ "$1" == "reboot" ]]; then
    echo ":: Reboot"
    if [[ -f "$FILE" ]]; then
        rm $FILE
    fi
    sleep 0.5
    systemctl reboot
fi

if [[ "$1" == "shutdown" ]]; then
    echo ":: Shutdown"
    if [[ -f "$FILE" ]]; then
        rm $FILE
    fi
    sleep 0.5
    systemctl poweroff
fi

if [[ "$1" == "suspend" ]]; then
    echo ":: Suspend"
    sleep 0.5
    systemctl suspend
    sleep 0.5
    hyprlock
fi
