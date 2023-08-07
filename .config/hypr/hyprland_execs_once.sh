#!/bin/bash

touch /tmp/hyprstart.lock;
waybar & 
swww init;
swww img ~/Imagens/wallpaper.webp;

killall -q dunst
while pgrep -x dunst >/dev/null; do sleep 1; done
swaync -c .config/swaync/config.json -s .config/swaync/style.css &

#clipboard
wl-paste --type text --watch cliphist store & #Stores only text data
wl-paste --type image --watch cliphist store & #Stores only image data

mpd;
mpDris2 & 
mpc random on
mpc play || mpc insert Chill/Somewhere\ Nowhere\ 🌸Deep\ Lofi\ Beats.mp3 && mpc next 
mpc toggle 
mpc toggle
./xdg-portal.sh &
nm-applet --indicator &
obsidian & 
librewolf &
keepassxc &
QT_QPA_PLATFORMTHEME=gtk3 discord-screenaudio --notify-send &
easyeffects & 
kitty --class=todo --single-instance -e lvim ~/TODO & 
calcurse --daemon & 
# bubblemaild &
syncthing-gtk --minimized & 


