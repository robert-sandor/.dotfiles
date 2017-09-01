#!/bin/sh

# set the main display
main_display=eDP1

# get all disconnected displays and turn them off
disconnected=`xrandr | grep " disconnected" | awk '{print $1}'`

for display in $disconnected
do
	xrandr --output $display --off
	echo "$display is disconnected and off"
done

# get all connected displays and turn them on left of the laptop display (eDP1)
connected=`xrandr | grep " connected" | awk '{print $1}'`

for display in $connected
do
	if [ "$display" != "$main_display" ]; then
		xrandr --output $display --primary --auto --left-of $main_display
		echo "$display is connected and on"
	fi
done

# restart polybar
~/.config/polybar/startup.sh
