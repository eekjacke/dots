#!/bin/sh

CRITICAL=10
NORMAL=20
STATUS=$(cat /sys/class/power_supply/BAT0/status)
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
echo $BATTERY_LEVEL
# Check if the battery level is below the threshold and discharging
if [ "$BATTERY_LEVEL" -lt "$CRITICAL" ]; then
    if [ $STATUS = "Discharging" ]; then
        # Send a notification using dunst
        dunstify -u critical -i battery-010 "Battery Critical" "Battery level is ${BATTERY_LEVEL}%!"
        mpv /usr/share/sounds/Oxygen-Sys-Warning.ogg 
    fi
elif [ "$BATTERY_LEVEL" -lt "$NORMAL" ]; then
    if [ $STATUS = "Discharging" ]; then
        # Send a notification using dunst
        dunstify -u normal -i battery-020 "Battery Low" "Battery level is ${BATTERY_LEVEL}%!"
        canberra-gtk-play -i battery-caution
    fi
fi