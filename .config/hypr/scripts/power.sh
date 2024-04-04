#!/bin/bash

logout (){
	killall waybar && swww kill && mpd --kill && hyprctl dispatch exit 
}

lock (){

	hyprlock


	# swaylock \
	# --daemonize \
	# --screenshots \
	# --clock \
	# --indicator \
	# --indicator-radius 100 \
	# --indicator-thickness 7 \
	# --effect-blur 7x5 \
	# --effect-vignette 0.5:0.5 \
	# --ring-color 1d272b \
	# --key-hl-color 03877A \
	# --line-color 090C0D \
	# --inside-color 090C0D \
	# --separator-color 090C0D \
	# --text-color 77e9df \
	# --line-clear-color 03877A \
	# --ring-clear-color 77e9df \
	# --inside-clear-color 1d272b \
	# --line-clear-color 1d272b \
	# --text-clear-color 77e9df \
	# --ring-wrong-color 02A2A6 \
	# --inside-wrong-color 090C0D \
	# --text-wrong-color 02A2A6 \
	# --grace 0 \
	# --font 'ShureTechMono Nerd Font Mono' \
	# --fade-in 0.2 
}

suspend (){
	sleep 2 && sudo systemctl suspend
	lock
}

shutdown (){
	swww kill
	mpd --kill
	hyprctl dispatch exit
	systemctl poweroff 
}

reboot (){
	swww kill
	mpd --kill
	hyprctl dispatch exit
	systemctl reboot 
}

case $1 in 
	logout) logout
		;;
	suspend) suspend
		;;
	lock) lock
		;;
	shutdown) shutdown
		;;
	reboot) reboot
		;;
esac
