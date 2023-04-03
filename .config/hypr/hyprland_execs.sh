#!/bin/bash

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
swww img --filter Nearest --transition-type outer --transition-pos 0.900,0.900 --transition-step 80 ~/Imagens/$(wpg -c)
