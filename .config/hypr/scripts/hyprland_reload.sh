
if [ -f /tmp/hyprstart.lock ]; then
	rm /tmp/hyprstart.lock
	exit 0
fi

## get wallpaper path
wall="$HOME/Imagens/"$(wpg -c)
finalwall="$wall"
filter="Nearest"

if [[ "$wall" != *"gif" ]]; then
	convert -resize 1920x1080 $wall $wall
	$finalwall="~/Imagens/wallpaper.png"
	$filter="Lanczos3"
else
	swww clear-cache
fi

# using screenshot instead
# generate wallpaper png for hyprlock, currently needed since it does not allow to use with commands or anything other than png files
# convert --quality 80 $wall ~/Imagens/wallpaper.png

## Update Wallpaper
swww img -f $filter --transition-type random --transition-duration 2 $finalwall

## Update theme
~/.config/hypr/scripts/import-gsettings.sh 
pywalfox update

# update swaync and spotify 
swaync-client -R & 
swaync-client -rs & 
#spicetify apply 

# update waybar
killall -q waybar

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 0.5; done

## Relaunch Waybar
waybar & disown

#update sddm
filename=$(basename -- "$wall")
extension="${filename##*.}"
echo $extension
finalname=wallpaper."$extension"

#update the sddm theme in the dumbest way cause syslinks stopped working for whatever reason
sudo cp -f $(echo $finalwall) /usr/share/sddm/themes/corners/backgrounds/$finalname
cp -f /home/traveler/.config/sddm/theme.conf /home/traveler/.config/sddm/theme2.conf
echo BgSource=\"backgrounds/$finalname\" >> /home/traveler/.config/sddm/theme2.conf
sudo cp -f /home/traveler/.config/sddm/theme2.conf /usr/share/sddm/themes/corners/theme.conf


