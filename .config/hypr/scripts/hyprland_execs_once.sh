#!/bin/bash

touch /tmp/hyprstart.lock;

## Waybar , notifications and wallpaper
swww init && swww img ~/Imagens/$(wpg -c)
waybar &  
swaync -c .config/swaync/config.json -s .config/swaync/style.css & 

kitty --class=todo --single-instance -e lvim ~/TODO & 
keepassxc & 
easyeffects & 
vencord-desktop & 
calcurse --daemon & 
syncthing-gtk --minimized & 
sleep 1 && obsidian & 
sleep 2 && librewolf & 

## clipboard
wl-paste --type text --watch cliphist store &  #Stores only text data
wl-paste --type image --watch cliphist store &  #Stores only image data

## Music
playerctld daemon & 
spotify & 
mpd & 
mpDris2 & 
mpc random on && mpc play || mpc insert Chill/Somewhere\ Nowhere\ 🌸Deep\ Lofi\ Beats.mp3 && mpc next && mpc toggle && mpc toggle

./xdg-portal.sh & 
nm-applet --indicator & 


