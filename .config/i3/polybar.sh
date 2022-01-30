#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

#set config

# Launch polybar
polybar -c ~/.config/polybar/config middle &
polybar -c ~/.config/polybar/config right &
polybar -c ~/.config/polybar/config left &
