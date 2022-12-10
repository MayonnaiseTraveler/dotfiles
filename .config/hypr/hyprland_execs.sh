#!/bin/bash

# Terminate already running instances
killall -q waybar
killall -q swaybg
killall -q dunst

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done
while pgrep -x dunst >/dev/null; do sleep 1; done
while pgrep -x swaybg >/dev/null; do sleep 1; done
 

waybar &
dunst &
swaybg -i ~/Imagens/$(wpg -c) -m fill &
~/.config/hypr/import-gsettings.sh
