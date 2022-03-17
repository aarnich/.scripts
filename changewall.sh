#!/usr/bin/env bash

wall_dir="$HOME/Pictures/Wallpapers/"
active_wallpaper="$HOME/Pictures/Wallpapers/active/active.png"

# script that applies changes to DWM
AUTOSTART=/usr/share/archcraft/dwm/bin/autostart.sh

# display all available wallpapers of a specific type

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "You must specify the file extension (jpg or png)"
    exit
fi

if [ $1 != "png" ] && [ $1 != "jpg" ]
  then
    echo "invalid file extension"
    exit
fi

echo $2
if [[ $2 == "-h" ]]
  then
    $HOME/.scripts/walls.sh $1
fi

echo "which wallpaper would you like to set?"
read wallpaper
new_wall=$wall_dir$wallpaper.$1
if [ -f "$new_wall" ]; then
    echo "$wallpaper exists."
    cp $active_wallpaper $wall_dir/active/active.BACK
    echo "backup created"
    bat $wall_dir/active/active.BACK
    sudo cp $new_wall $active_wallpaper
    bash $AUTOSTART
else 
    echo "$wallpaper does not exist."
fi
# NEW_WALL=$(pwd)/$1
# WALL_DIR=/usr/share/archcraft/dwm/wallpapers/default.png
#
#
# cp $NEW_WALL $WALL_DIR
# bash $AUTOSTART
