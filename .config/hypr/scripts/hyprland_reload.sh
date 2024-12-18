if [ -f /tmp/hyprstart.lock ]; then
	rm /tmp/hyprstart.lock
	exit 0
fi

# get wallpaper path

wall="$HOME/.config/Wallpapers/"$(wpg -c)

finalwall="$wall"

filter="Nearest"

if [[ "$wall" != *"gif" ]]; then
	
	filter="Lanczos3"
else
	swww clear-cache
fi

# Update Wallpaper
swww img -f $filter --transition-type random --transition-duration 2 "$finalwall"

# Update theme

$HOME/.config/hypr/scripts/import-gsettings.sh 
pywalfox update

# update swaync and spotify 
swaync-client -R & 
swaync-client -rs & 

# update waybar
killall -q waybar

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 0.5; done

## Relaunch Waybar
waybar & disown

#update sddm
filename=$(basename -- "$wall")
extension="${filename##*.}"

# echo $extension
finalname=wallpaper."$extension"

#update the sddm theme in the dumbest way cause syslinks stopped working for whatever reason
sudo cp -f $finalwall /usr/share/sddm/themes/corners/backgrounds/$finalname
cp -f $HOME/.config/sddm/theme.conf $HOME/.config/sddm/theme2.conf
echo BgSource=\"backgrounds/$finalname\" >> $HOME/.config/sddm/theme2.conf
sudo cp -f $HOME/.config/sddm/theme2.conf /usr/share/sddm/themes/corners/theme.conf

# ~/.config/hypr/scripts/xdg-portal-reset.sh
