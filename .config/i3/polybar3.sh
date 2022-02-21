#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

#set config

# Launch polybar
polybar -c ~/.config/polybar/config3 middle &
polybar -c ~/.config/polybar/config3 right &
polybar -c ~/.config/polybar/config3 left &
