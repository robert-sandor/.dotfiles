#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Get all of the connected monitors
connected=`xrandr | grep " connected" | awk '{print $1}'`

# Launch a bar on every display
for display in $connected
do
    MONITOR=$display polybar main_bar &
done

echo "Bars launched..."
