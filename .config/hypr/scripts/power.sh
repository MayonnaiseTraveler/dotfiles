#!/bin/bash

logout (){
	killall waybar && swww kill && killall mpd && killall hyprland 
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
	killall mpd
	killall hyprland
	systemctl poweroff 
}

reboot (){
	swww kill
	killall mpd
	killall hyprland
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
