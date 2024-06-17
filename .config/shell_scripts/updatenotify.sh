#!/bin/bash

# Capture the output of checkupdates
updates=$(checkupdates 2>/dev/null)

# Check if there are updates available
if [ -n "$updates" ]; then
    # Count the number of updates
    update_count=$(echo "$updates" | wc -l)

    # If script was called with no args (cron)
    if [ $# = 0 ]; then
        # Send notification with dunstify
        dunstify -u normal -i /home/jacob/Pictures/pacman.png -h string:x-dunst-stack-tag:updates "$update_count available package updates!" "$updates"
    # If script was called with one arg (eww)
    elif [ $# = 1 ]; then
        # Update eww widget 
        CFG_DIR=$1
        eww -c $CFG_DIR update summary="$update_count available package updates!"
        eww -c $CFG_DIR update body="$updates"
    else
        :
    fi
else
    if [ $# = 1 ]; then
        # Update eww widget 
        CFG_DIR=$1
        eww -c $CFG_DIR update summary="System is fully up-to-date!"
        eww -c $CFG_DIR update body=""
    else
        :
    fi
fi

