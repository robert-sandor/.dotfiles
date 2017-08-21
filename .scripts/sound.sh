#!/bin/bash

action=$1

offset=${2:-5}

if [ "$action" == "up" ]; then
	amixer -q set Master $offset%+ unmute
elif [ "$action" == "down" ]; then
	amixer -q set Master $offset%- unmute
elif [ "$action" == "mute" ]; then
	amixer -q set Master toggle
else
	echo "Usage $0 [ up | down | mute ] {offset}"
	exit 1
fi

volume=$(amixer -M sget Master | grep "Front Left:" | awk '{print $5}' | sed 's/[^0-9]//g')

DUNST_VOLUME_FILE=/tmp/.dunst_volume
dunst_id=$(cat $DUNST_VOLUME_FILE)
if [ $dunst_id -gt "0" ]; then
	dunstify -p -r $dunst_id "Volume: $volume" > $DUNST_VOLUME_FILE
else
	dunstify -p "Volume: $volume" > $DUNST_VOLUME_FILE
fi


