#!/bin/bash

action=$1

offset=${2:-5}

icon=""
if [ "$action" == "up" ]; then
	xbacklight -inc $offset
elif [ "$action" == "down" ]; then
	xbacklight -dec $offset
else
	echo "Usage $0 [ up | down ] {offset}"
	exit 1
fi

backlight=$(xbacklight)
backlight=${backlight%.*}

DUNST_BACKLIGHT_FILE=/tmp/.dunst_backlight
dunst_id=$(cat $DUNST_BACKLIGHT_FILE)
if [ $dunst_id -gt "0" ]; then
	dunstify -p -r $dunst_id "$icon $backlight" -t 200 > $DUNST_BACKLIGHT_FILE
else
	dunstify -p "$icon $backlight" -t 200 > $DUNST_BACKLIGHT_FILE
fi


