#!/bin/bash

nwg-menu \
-va top \
-term='kitty' \
-slen 40 \
-ml 4 \
-mt 8 \
-cmd-lock "$HOME/.config/hypr/scripts/power.sh lock" \
-cmd-logout "$HOME/.config/hypr/scripts/power.sh logout" \
-cmd-restart "$HOME/.config/hypr/scripts/power.sh reboot" \
-cmd-shutdown "$HOME/.config/hypr/scripts/power.sh shutdown"
