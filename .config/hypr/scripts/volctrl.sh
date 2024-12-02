#!/bin/bash

# Usage:
# volctrl.sh source [option]
# -------------------------------
# volctrl.sh audio [up|down|mute]
# volctrl.sh music [up|down|prev|next|pause|shuffle|prev_player|next_player]

volup_icon="$HOME/.local/share/icons/flattrcolor/status/22/audio-volume-high.svg"
volmute_icon="$HOME/.local/share/icons/flattrcolor/status/22/audio-volume-muted.svg"
shuffle_icon="$HOME/.local/share/icons/flattrcolor/actions/22/media-playlist-shuffle.svg"

music_library="$HOME/SYNC/playlist"
fallback_image="$HOME/.local/share/.icons/flattrcolor-dark/categories/scalable/applications-multimedia.svg"

notify_playing() {

    get_cover >/dev/null 2>&1

	if playerctl metadata | grep -m 1 -o spotify; then
	exit 1
	fi
	notify-send -a "mpd" -i "$cover_path" -r 43 "Now Playing" "$(mpc --format '%title% \n%artist% - %album%' current)" 
}

get_cover() {

    # First we check if the audio file has an embedded album art
    ext="$(mpc --format %file% current | sed 's/^.*\.//')"
    if [ "$ext" = "flac" ]; then
        # since FFMPEG cannot export embedded FLAC art we use metaflac
        metaflac --export-picture-to=/tmp/mpd_cover.jpg \
            "$(mpc --format "$music_library"/%file% current)" &&
            cover_path="/tmp/mpd_cover.jpg" &&
			convert "$cover_path" -resize 512x512^ -gravity Center -extent 512x512 "$cover_path" > /dev/null 2>&1 &&
			return
    else
        ffmpeg -y -i "$(mpc --format "$music_library"/%file% | head -n 1)" \
            /tmp/mpd_cover.jpg &&
            cover_path="/tmp/mpd_cover.jpg"&&
			convert "$cover_path" -resize 512x512^ -gravity Center -extent 512x512 "$cover_path" > /dev/null 2>&1 &&
			return
    fi

    # If no embedded art was found we look inside the music file's directory
    album="$(mpc --format %album% current)"
    file="$(mpc --format %file% current)"
    album_dir="${file%/*}"
    album_dir="$music_library/$album_dir"
    found_covers="$(find "$album_dir" -type d -exec find {} -maxdepth 1 -type f \
    -iregex ".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\\(jpe?g\|png\|gif\|bmp\)" \; )"
    cover_path="$(echo "$found_covers" | head -n1)"
    if [ -n "$cover_path" ]; then
        return
    fi

    # If we still failed to find a cover image, we use the fallback
    if [ -z "$cover_path" ]; then
        cover_path=$fallback_image
    fi
}

vol()
{
	case $1 in
		audio)
			pamixer $2 5
			volume_int="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9]//g')"
			volume="$(echo "$volume_int" | sed 's/^0//g')%"

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
		up) vol audio -i
		;;
		down) vol audio -d 
		;;
		mute) 
			wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle &

			volume_int="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9]//g')"

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
			playerctl next
			notify_playing & 
		;;
		prev) 
			playerctl previous &
			notify_playing &
		;;
		pause) 
			playerctl play-pause &

			title="$(playerctl metadata --format '{{title}}' )"
			player_icon="$(playerctl metadata --format '{{ playerName }}')"

			notify-send -r 45 "   Toggled Puase" "$title" -i "$player_icon" &
		;;
		next_player) 
			#next_player 
			playerctld shift &

			player="$(playerctl metadata --format '{{ playerName }}')"
			player_icon="$(playerctl metadata --format '{{ playerName }}')"

			notify-send -r 45 "Current Player:" "$player" -i "$player_icon" &
		;;
		prev_player) 
			#prev_player
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


