<hr>

<pre> _    ___       _                       _      
| |  / (_)   __(_)___ _____  ____  ___ ( )_____
| | / / / | / / / __ `/ __ \/ __ \/ _ \|// ___/
| |/ / /| |/ / / /_/ / / / / / / /  __/ (__  ) 
|___/_/ |___/_/\__,_/_/ /_/_/ /_/\___/ /____/  
                                               
</pre>

<pre>
 D O T F I L E S
</pre>

<hr>

<img src="gitdotfiles/screenshot1.png">

<img src="gitdotfiles/screenshot2.png">


This repository contains the dots for my Arch Linux Setup, currently it has:

* WM's : 
  * Hyprland
  
* Bar/Menus :
  * Waybar
  * wofi and rofi
  * quickmedia (Quickly download stuff and check some websites ) 

* Themes : 
  * wpgtk (generates color palette from selected wallpaper and updates all configurations accordingly)
  * FlattrColor (icon theme for gtk )
  * ePapirus (icon theme used by rofi and polybar)
  * FlatColor2 (gtk theme)
  * bibata-cursor-theme-bin (cool rainbow cursors lol)

* System Utils:
	* pipewire (Sound Software)
	* pavucontrol (gui to change audio stuff)
	* EasyEffects (Filters to improve your mic audio)
	* nohang (kills processes that aren't responding)
	* ananicy (auto nice deamon that automatically set's processes priorities )
	* nm-applet (network management tray icon)
	* sddm (display manager)
  
* CLI Programs :
	* kitty (terminal)
	* lvim ( Lunar Vim, an ide layer over vim)
	* btop (Haha look at my cool linux rice)
	* ranger (File explorer, aliased to r)
	* xplr (Faster file explorer, aliased to x)
	* ncmpcpp (music player, aliased to n)
	* cava (Audio Visualizer)
	* todo (Simple todo list)
	* termdown (simple countdown timer)
	* calcurse ( ncurses based calendary)
	* blesh (syntax highligting better autocomplete and nvim on bash)
	* scrcpy (can be used to screencast android to pc)

* GUI Programs : 
	* Social stuff:
		* Telegram (yeeeah)
		* Whatsapp (yeah the zuck can see my system )
		* Discord (with betterdiscord )
		* Discord-screenaudio (wayland screensharing )
		* Discover-overlay (Discord overlay everywhere)
		* Postybirb (Manage various social media )
	* Gaming : 
		* steam-runtime
		* minecraft (both original and prism launcher)
	* Creative Tools : 
		* ManusKript (Novel writing software)
		* Obsidian (markdown notetaking)
		* Krita (art software)
		* Onlyoffice 
		* Audacity
* General Stuff:
  	* Firefox
    * Librewolf 
	* Syncthing
    * iriun webcam (use your phone as a webcam)
    * mpv (media player)
    * zathura (view pdfs)
    * Thunar file manager
    * qbittorrent
    * Arandr (screen configs)
    * BleachBit (system cleaning util)
    * KeePassXC ( password manager)

***

### Installation
if you use something else than just change it in the following command.

```bash
# Cloning the repo, will overwrite you local configs
git clone --bare <git-repo-url> $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME"'
dotfiles checkout -f
dotfiles config --local status.showUntrackedFiles no

# Downloading the needed packages (+ some extra stuff you might not use)
paru -S --needed $(echo ~/gitdotfiles/PC-Packages.txt)

# Update WPGTK Symlinks, add WPGTK wallpapers, and generate a colorscheme
$XDG_CONFIG_HOME/wpg/fix-symlinks.sh
wpg -a $XDG_CONFIG_HOME/Wallpapers/*
wpg -A $XDG_CONFIG_HOME/Wallpapers/*

```
make sure you enable sddm and have files with correct permissions, then reboot.

***

### ToDo:
- [ ] Remove unecessary files 
- [ ] Clear Scripts and re-organize files
- [ ] Create scripts for a backup system
- [ ] Update this readme more
- [ ] Create Keybind list in Readme
- [ ] Create bash script for installation
- [ ] Create Eww widgets
- [ ] Create a bar with Eww
- [ ] finish bash script that changes volume of the active window // unused
- [ ] add a list of browser extensions i use 
- [ ] fix lvim colorscheme

