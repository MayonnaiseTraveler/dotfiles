#!/bin/sh

filename="/tmp/mpd_cover.jpg"
previewname="/tmp/mpd_preview.jpg"
convert "$filename" -resize 128x128^ -gravity Center -extent 128x128 "$previewname" > /dev/null 2>&1

notify-send -a "mpd" -i "$previewname" -r 43 "Now Playing" "$(mpc --format '%title% \n%artist% - %album%' current)" 
