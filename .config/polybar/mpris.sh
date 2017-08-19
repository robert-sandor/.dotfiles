#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
play_icon=""
pause_icon=""
stop_icon=""

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "%{F#7cafc2}$play_icon $metadata"       # Orange when playing
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#585858}$pause_icon $metadata"       # Greyed out info when paused
else
    echo "%{F#585858}$stop_icon"                 # Greyed out icon when stopped
fi
