#!/bin/bash

if [ -f /tmp/hyprstart.lock ]; then
	rm /tmp/hyprstart.lock
	exit 0
fi

# Terminate already running instances
killall -q waybar
killall -q dunst

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done
while pgrep -x dunst >/dev/null; do sleep 1; done
 

~/.config/hypr/import-gsettings.sh &
waybar &
dunst &
convert --quality 90 ~/Imagens/$(wpg -c)[0] ~/Imagens/wallpaper.webp & 
swww img \
	--transition-type random \
	--transition-duration 2 \
	--transition-fps 60 \
	~/Imagens/$(wpg -c)
