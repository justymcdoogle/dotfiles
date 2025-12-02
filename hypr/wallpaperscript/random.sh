#!/bin/bash

# Checks if already running, if not, run
if ! pgrep -x swww-daemon > /dev/null; then
    swww-daemon &
fi

WALLPAPER_DIR="/home/plonky/wallpapers"

# get current wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" | shuf -n 1)
swww img "$WALLPAPER" --transition-type grow --transition-duration 2 --transition-pos 0.9,0.9
