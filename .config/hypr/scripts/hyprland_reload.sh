#!/bin/bash

if [ -f /tmp/hyprstart.lock ]; then
	rm /tmp/hyprstart.lock
	exit 0
fi

# Terminate already running instances
killall -q waybar
swaync-client -R & 
swaync-client -rs & 

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

## Relaunch Waybar
waybar 

## Update theme
~/.config/hypr/import-gsettings.sh &

## Update Wallpaper
convert --quality 90 ~/Imagens/$(wpg -c)[0] ~/Imagens/wallpaper.webp 

swww img \
	--transition-type random \
	--transition-duration 2 \
	~/Imagens/$(wpg -c) 

## Relaunch xdg-desktop-portal
~/.config/hypr/xdg-portal.sh & 
