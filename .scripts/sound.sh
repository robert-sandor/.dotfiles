#!/bin/bash

action=$1

offset=${2:-5}

icon=""
if [ "$action" == "up" ]; then
	amixer -q set Master $offset%+ unmute
elif [ "$action" == "down" ]; then
	amixer -q set Master $offset%- unmute
	icon=""
elif [ "$action" == "mute" ]; then
	amixer -q set Master toggle
	status=$(amixer -M sget Master | grep "Front Left:" | awk '{print $6}' | sed 's/[^a-z]//g')
	if [ "$status" == "off" ]; then
		icon=""
	fi
else
	echo "Usage $0 [ up | down | mute ] {offset}"
	exit 1
fi

volume=$(amixer -M sget Master | grep "Front Left:" | awk '{print $5}' | sed 's/[^0-9]//g')

DUNST_VOLUME_FILE=/tmp/.dunst_volume
dunst_id=$(cat $DUNST_VOLUME_FILE)
if [ $dunst_id -gt "0" ]; then
	dunstify -p -r $dunst_id "$icon $volume" -t 200 > $DUNST_VOLUME_FILE
else
	dunstify -p "$icon $volume" -t 200 > $DUNST_VOLUME_FILE
fi


