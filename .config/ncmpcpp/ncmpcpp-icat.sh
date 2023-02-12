#!/bin/bash
#

music_library="$HOME/MEGA/playlist"
fallback_image="$HOME/.config/ncmpcpp/default_cover.png"
padding_top=3
padding_bot=2
image_width=35
reserved_cols_in_percent="false"
square_alignment="bottom"

main() {
    kill_previous_instances >/dev/null 2>&1
    get_cover>/dev/null 2>&1
    display_cover     2>/dev/null
    # detect_window_resizes   >/dev/null 2>&1
}

kill_previous_instances() {
    script_name=$(basename "$0")
    for pid in $(pidof -x "$script_name"); do
        if [ "$pid" != $$ ]; then
            kill -15 "$pid"
        fi 
    done
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

display_cover(){
	term_lines=$(tput lines)
    term_cols=$(tput cols)
	win_size="$(kitty +kitten icat --print-window-size)"
	win_h="$( sed "s/x.*//" <<< "$win_size" )"
	win_w="$( sed "s/.*x//" <<< "$win_size" )"
	cols_f=$((" "$term_cols" - "$padding_bot" "))
	img_w=$((" "$cols_f" * $image_width" / 100 ))
	kitty +kitten icat --clear
	kitty +kitten icat --align left --place "$img_w"x"$img_w"@0x"$padding_top" "/tmp/mpd_cover.jpg"

}

main
