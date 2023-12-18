#!/usr/bin/env bash

FIFO_PATH="$1"
IMAGE="$2"
MAINWINDOW="$(hyprctl activewindow | grep -v  title | sed -e 's/^\s*//' -e '/^$/d' | grep 'pid:[^*]' )"
IMV_PID="$(pgrep imv)"

if [ ! "$IMV_PID" ]; then
  imv "$IMAGE" &
  IMV_PID=$!
fi

sleep 0.5

hyprctl dispatch focuswindow MAINWINDOW
#xdotool windowactivate "$MAINWINDOW"

while read -r path; do
  imv-msg "$IMV_PID" close all
  imv-msg "$IMV_PID" open "$path"
done < "$FIFO_PATH"

imv-msg "$IMV_PID" quit
[ -e "$FIFO_PATH" ] && rm -f -- "$FIFO_PATH"

