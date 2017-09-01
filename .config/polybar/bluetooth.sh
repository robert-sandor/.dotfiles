#!/bin/bash

icon=""
icon_enabled="%{F#7cafc2}$icon"
icon_disabled="%{F#585858}$icon"
status=`systemctl is-active bluetooth.service`

if [ $status == "active" ]; then
	echo "$icon_enabled"
else
	echo "$icon_disabled"
fi
