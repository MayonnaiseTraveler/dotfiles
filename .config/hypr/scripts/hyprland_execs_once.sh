#!/bin/bash

touch /tmp/hyprstart.lock;
waybar & 
swww init;
swww img ~/Imagens/$(wpg -c);

killall -q dunst
while pgrep -x dunst >/dev/null; do sleep 1; done
swaync -c .config/swaync/config.json -s .config/swaync/style.css &

#clipboard
wl-paste --type text --watch cliphist store & #Stores only text data
wl-paste --type image --watch cliphist store & #Stores only image data

playerctld daemon &
spotify & 
mpd &
mpDris2 & 
mpc random on
mpc play || mpc insert Chill/Somewhere\ Nowhere\ 🌸Deep\ Lofi\ Beats.mp3 && mpc next 
mpc toggle 
mpc toggle
./xdg-portal.sh
nm-applet --indicator &
obsidian & 
librewolf &
keepassxc &
vencord-desktop &
easyeffects & 
kitty --class=todo --single-instance -e lvim ~/TODO & 
calcurse --daemon & 
# bubblemaild &
syncthing-gtk --minimized & 


