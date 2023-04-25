#!/bin/bash
touch /tmp/hyprstart.lock & 
waybar &
dunst &
swww init &
sleep 2 && swww img --sync --filter Nearest --transition-duration 0 ~/Imagens/wallpaper.webp &

#clipboard
wl-paste --type text --watch cliphist store & #Stores only text data
wl-paste --type image --watch cliphist store & #Stores only image data

mpd &
nm-applet --indicator &
librewolf &
sleep 1 &
discord-screenaudio &
easyeffects & 
sleep 4 &
whatsapp-nativefier &
sleep 4 &
telegram-desktop & 
