#!/bin/bash

logout (){
	killall waybar && swww kill && mpd --kill && hyprctl dispatch exit 
}

lock (){

	hyprlock
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
