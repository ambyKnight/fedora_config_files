#!/bin/bash

MODE_FILE="/tmp/power_mode"

if [ ! -f "$MODE_FILE" ]; then
    echo "performance" > "$MODE_FILE"
fi

MODE=$(cat "$MODE_FILE")

if [ "$MODE" = "performance" ]; then
    echo "battery" > "$MODE_FILE"

    # Kill picom
    killall picom

    # Set 60Hz
    xrandr --output DP-2 --mode 1920x1080 --rate 60.00

    notify-send "Power Mode" "Battery Saver 🔋"

else
    echo "performance" > "$MODE_FILE"

    # Start picom
    picom --config ~/.config/picom/picom.conf &

    # Set 144Hz
    xrandr --output DP-2 --mode 1920x1080 --rate 144.00

    notify-send "Power Mode" "Performance ⚡"
fi
