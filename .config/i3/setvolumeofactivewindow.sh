#!/bin/bash

activewindow=$( xdotool getactivewindow)

windowname=$( xdotool getwindowname $activewindow )

#windowpid=$(pidof $windowname)
windowpid=$( xdotool getwindowpid $activewindow )

#use pgrep -P and recursion to get to the last child process of every process, and run the audio command on every single one

#windowpid=$(ps aux | grep -m 1 -i $windowname | cut -c 10-18 | grep -o '[0-9]*')




set_volume() {

	windowindex=$( pacmd list-sink-inputs  | grep -m 1 -B 25 $1 | grep "index" | grep -o '[0-9]*' )
	pacmd set-sink-input-volume $windowindex 1000
}


list_offspring() {
	tp=$(pgrep -P $1)						#get childs pids of parent pid
  	for i in $tp; do						#loop through childs
    		if [ -z $i ]; then					#check if empty list
      			exit						#if empty: exit
    		else							#else
			set_volume $i				#print childs pid
			list_offspring $i
			notify-send "setting volume of window $i"
			#call list_offspring again with child pid as the parent
	 	fi;
  	done
}

list_offspring $windowpid


##pacmd list sinks
##use grep to find the sink that has the window name and get the window name


#windowindex= $(grep $sinkInfo "client.*musikcube" | grep -o '[0-9]*')
#windowindex=$( pacmd list sinks | grep "client.*musikcube" | grep -o '[0-9]*' )
#windowindex=$( pacmd list sink | grep -m 1 -B 4 "musikcube" | grep -m 1 -o '[0-9]*')
echo $windowindex

echo "active window name: $windowname"

notify-send "Changing Volume of $windowname 
window index: $windowindex
windowpid: $windowpid"

