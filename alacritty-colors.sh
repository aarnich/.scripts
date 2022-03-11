#!/usr/bin/env bash
new_scheme=$(pwd)/$1
colors_dir=$HOME/.config/alacritty_themes/colors.yml

sudo cp $new_scheme $colors_dir
