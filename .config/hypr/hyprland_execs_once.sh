#!/bin/bash

touch /tmp/hyprstart.lock & 
waybar &
swww init &
swww img --sync --filter Nearest --transition-duration 0 ~/Imagens/wallpaper.webp &
swaync -c .config/swaync/config.json -s .config/swaync/style.css &

#clipboard
wl-paste --type text --watch cliphist store & #Stores only text data
wl-paste --type image --watch cliphist store & #Stores only image data

mpd &
calcurse --daemon & 
mpDris2 & 
bubblemaild &
nm-applet --indicator &
obsidian & 
syncthing-gtk --minimized & 
librewolf &
keepassxc &
QT_QPA_PLATFORMTHEME=kde discord-screenaudio -style breeze &
easyeffects & 
