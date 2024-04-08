#!/bin/bash

#exit if playerctl is running spotify
if playerctl metadata | grep -m 1 -o spotify; then
  exit 1
fi

filename="/tmp/mpd_cover.jpg"
previewname="/tmp/mpd_preview.jpg"
convert "$filename" -resize 128x128^ -gravity Center -extent 128x128 "$previewname" > /dev/null 2>&1

notify-send -a "mpd" -i "$previewname" -r 43 "Now Playing" "$(mpc --format '%title% \n%artist% - %album%' current)" 
