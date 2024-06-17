#!/bin/bash

### volumeControl
### Bindable volume control to keyboard presses
# Created by: Jacob Eek 2024-06-07
# Arbitrary but unique message tag
msgTag="myvolume"

LOW_THRESHOLD=25
MEDIUM_THRESHOLD=75

dunst_notif() {
    currentVolume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Eo '[0-9]+%' | uniq)
    #echo $currentVolume
    #echo ${currentVolume%?}
    if [[ ${currentVolume%?} = 0 ]]; then
        icon="notification-audio-volume-off"
    elif [[ ${currentVolume%?} < $LOW_THRESHOLD ]] then
        icon="notification-audio-volume-low"
    elif [[ ${currentVolume%?} < $MEDIUM_THRESHOLD ]] then
        icon="notification-audio-volume-medium"
    else
        icon="notification-audio-volume-high"
    fi
    dunstify -a "changeVolume" -u low -i $icon -h string:x-dunst-stack-tag:$msgTag \
            -h int:value:"$currentVolume" "Volume: ${currentVolume}"
}


isMuted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'Mute.*' | cut -f2- -d:)
case $1 in
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        isMuted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'Mute.*' | cut -f2- -d:)
        if [ $isMuted = "yes" ]; then
            dunstify -a "changeVolume" -u low -i notification-audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted" 
        else
            dunst_notif
        fi
        ;;
    increase)
        if [ $isMuted = "yes" ]; then
            pactl set-sink-mute @DEFAULT_SINK@ toggle
        fi
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        dunst_notif
        canberra-gtk-play -i audio-volume-change -d "changeVolume"
        ;;
    decrease)
        if [ $isMuted = "yes" ]; then
            pactl set-sink-mute @DEFAULT_SINK@ toggle
        fi
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        dunst_notif
        canberra-gtk-play -i audio-volume-change -d "changeVolume"
        ;;
    *)
        ;;
esac
