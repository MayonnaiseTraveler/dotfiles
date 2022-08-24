#!/bin/bash
xdotool search "xborder" windowkill

while pgrep -x "xborder" >/dev/null; do sleep 1; done

python3 ~/.config/xborder/xborders -c ~/.config/i3/border.json

