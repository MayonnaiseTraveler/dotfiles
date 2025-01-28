#!/bin/bash

#fetch new stuff, discard local changes, update
git --git-dir="/$HOME/.cfg/" --work-tree="$HOME" fetch
git --git-dir="/$HOME/.cfg/" --work-tree="$HOME" reset --hard HEAD 
git --git-dir="/$HOME/.cfg/" --work-tree="$HOME" merge origin/$CURRENT_BRANCH

# Update WPGTK Symlinks, add WPGTK wallpapers, and generate a colorscheme
$XDG_CONFIG_HOME/wpg/fix-symlinks.sh
wpg -a $XDG_CONFIG_HOME/Wallpapers/*
wpg -A $(wpg -l)
