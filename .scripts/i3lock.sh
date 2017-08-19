#!/bin/sh

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
i3lock -u -i /tmp/screen.png
rm /tmp/screen.png
sleep 2; pgrep i3lock && xset dpms force off
