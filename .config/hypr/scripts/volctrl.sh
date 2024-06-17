#!/bin/bash

volup_icon="$HOME/.local/share/icons/flattrcolor/status/22/audio-volume-high.svg"
volmute_icon="$HOME/.local/share/icons/flattrcolor/status/22/audio-volume-muted.svg"
shuffle_icon="$HOME/.local/share/icons/flattrcolor/actions/22/media-playlist-shuffle.svg"

vol()
{
	case $1 in
		audio)
			wpctl set-volume @DEFAULT_AUDIO_SINK@ $2 &
			volstr="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed s/'Volume:'/''/g | sed s/'\.'/''/g)"
			volume="$(echo "$volstr" | sed 's/^.0//g')%"
			volume_int="$(echo "$volstr" | sed 's/ //g')"

			notify-send -r 45 "Audio Volume:" "$volume" -a volup -h int:value:"$volume_int" -i "$volup_icon" &
		;;
		music)
			#printf spits some weird errors, idk how to fix so i wont.
			playerctl volume $2 &

			vol_value=$(playerctl metadata --format '{{ volume*100 }}')
			music_vol=$(printf "%.0f%%" $vol_value)
			music_title="$(playerctl metadata --format '{{title}}' )"

			music_vol_int="$(printf "%d%%\n" $(playerctl metadata --format '{{ volume*100 }}'))"
			player_icon="$(playerctl metadata --format '{{ playerName }}')"

			notify-send -r 44 "Music Volume: $music_vol" "$music_title"  -a volup -h int:value:"$music_vol_int" -i "$player_icon" &
			;;
	esac
}


audio()
{
	case $1 in
		up) vol audio 5%+
		;;
		down) vol audio 5%-
		;;
		mute) 
			wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle &

			volstr="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed s/'Volume:'/''/g | sed s/'\.'/''/g)"
			volume_int="$(echo "$volstr" | sed 's/ //g')"

			notify-send -r 45 "Audio Muted:" -a voltoggle -h int:value:$volume_int -i $volmute_icon

		;;
	esac
}

music ()
{
	case "$1" in
		up) vol music 0.05+
		;;
		down) vol music 0.05-
		;;
		next)
			playerctl next &
			~/.config/ncmpcpp/ncmpcpp-icat.sh &
			~/.config/ncmpcpp/songinfo.sh &
		;;
		prev) 
			playerctl previous &
			~/.config/ncmpcpp/ncmpcpp-icat.sh &
			~/.config/ncmpcpp/songinfo.sh &
		;;
		pause) 
			playerctl play-pause &

			title="$(playerctl metadata --format '{{title}}' )"
			player_icon="$(playerctl metadata --format '{{ playerName }}')"

			notify-send -r 45 "   Toggled Puase" "$title" -i "$player_icon" &
		;;
		next_player) next_player 
			playerctld shift &

			player="$(playerctl metadata --format '{{ playerName }}')"
			player_icon="$(playerctl metadata --format '{{ playerName }}')"

			notify-send -r 45 "Current Player:" "$player" -i "$player_icon" &
			;;
		prev_player) prev_player
			playerctld unshift &

			player="$(playerctl metadata --format '{{ playerName }}')"
			player_icon="$(playerctl metadata --format '{{ playerName }}')"

			notify-send -r 45 "Current Player:" "$player" -i "$player_icon" &
		;;
		shuffle) 
			playerctl shuffle Toggle &

			playername="$(playerctl metadata --format '{{ playerName }}')"
			shufflestatus="Music Shuffle Toggled $(playerctl shuffle)!"

			notify-send -r 45 "$shufflestatus" "$playername" -i "$shuffle_icon" &
		;;
	esac
	
}


case $1 in 
	audio) audio $2
	;;
	music) music $2 
	;;
esac



