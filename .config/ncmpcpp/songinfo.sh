#!/bin/sh

filename="/tmp/mpd_cover.jpg"
previewname="/tmp/mpd_preview.jpg"
convert "$filename" -resize 128x128^ -gravity Center -extent 128x128 "$previewname" > /dev/null 2>&1

dunstify -r 45 "Now Playing" "$(mpc --format '%title% \n%artist% - %album%' current)" -i "$previewname"
