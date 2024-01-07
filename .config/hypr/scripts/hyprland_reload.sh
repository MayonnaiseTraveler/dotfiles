
if [ -f /tmp/hyprstart.lock ]; then
	rm /tmp/hyprstart.lock
	exit 0
fi

wall="$HOME/Imagens/"$(wpg -c)

#update sddm
filename=$(basename -- "$wall")
extension="${filename##*.}"
echo $extension
finalname=wallpaper."$extension"

#update the sddm theme in the dumbest way cause syslinks stopped working for whatever reason
sudo cp -f $(echo $wall) /usr/share/sddm/themes/corners/backgrounds/$finalname
cp -f /home/traveler/.config/sddm/theme.conf /home/traveler/.config/sddm/theme2.conf
echo BgSource=\"backgrounds/$finalname\" >> /home/traveler/.config/sddm/theme2.conf
sudo cp -f /home/traveler/.config/sddm/theme2.conf /usr/share/sddm/themes/corners/theme.conf

# Terminate already running instances
killall -q waybar
# spicetify apply 
swaync-client -R & 
swaync-client -rs & 

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

## Relaunch Waybar
waybar & 

## Update theme
~/.config/hypr/scripts/import-gsettings.sh 

pywalfox update

## Update Wallpaper
# convert --quality 90 ~/Imagens/$(wpg -c)[0] ~/Imagens/wallpaper.png
swww img \
	--transition-type random \
	--transition-duration 2 \
	$wall

# spotify & 
