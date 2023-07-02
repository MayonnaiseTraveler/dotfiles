#!/bin/bash
touch /tmp/hyprstart.lock & 
waybar &
swaync -c .config/swaync/config.json -s .config/swaync/style.css &
swww init &
sleep 2 && swww img --sync --filter Nearest --transition-duration 0 ~/Imagens/wallpaper.webp &

#clipboard
wl-paste --type text --watch cliphist store & #Stores only text data
wl-paste --type image --watch cliphist store & #Stores only image data

mpd &
nm-applet --indicator &
obsidian & 
librewolf &
sleep 1 &
QT_QPA_PLATFORMTHEME=kde discord-screenaudio -style breeze &
easyeffects & 
