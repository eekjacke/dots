#!/bin/sh

msgTag="brightness"

MAX_BRIGHTNESS=24000

percentage() {
    ratio=$(awk "BEGIN {print $1 / $MAX_BRIGHTNESS}")
    echo $(awk "BEGIN {print $ratio * 100}")
}

case $1 in
    decrease)
        brightnessctl set 10%-
        current=$(brightnessctl get)
        brightness=$(percentage $current)
        echo $brightness
        dunstify -a "changeBrightness" -u low -i display-brightness-symbolic -h string:x-dunst-stack-tag:$msgTag \
            -h int:value:"$brightness" "Brightness: ${brightness}%"
        ;;
    increase)
        brightnessctl set +10%
        current=$(brightnessctl get)
        brightness=$(percentage $current)
        echo $brightness
        dunstify -a "changeBrightness" -u low -i display-brightness-symbolic -h string:x-dunst-stack-tag:$msgTag \
            -h int:value:"$brightness" "Brightness: ${brightness}%"
        ;;
    *)
        ;;
esac
