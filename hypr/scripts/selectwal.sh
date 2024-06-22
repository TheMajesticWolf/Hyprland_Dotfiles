#!/usr/bin/bash
wallpaper_dir="/home/aditya/gitclones/Wallpaper-Bank/wallpapers"

# files=$(ls --group-directories-first "$wallpaper_dir")

# All the files and directories
files=$(ls --group-directories-first "$wallpaper_dir" | grep -e "^\w.*\w$") 

selected_option=$(echo "$files" | rofi -dmenu -i -p "Wallpaper")

if [[ -z $selected_option ]] then
    echo "Exiting..."
    exit 0
fi

while [[ -d "$wallpaper_dir/$selected_option" ]] do

	wallpaper_dir="$wallpaper_dir/$selected_option"

	files=$(ls --group-directories-first "$wallpaper_dir" | grep -e "^\w.*\w$") 

	selected_option=$(echo "$files" | rofi -dmenu -i -p "Wallpaper")

	if [[ -z $selected_option ]] then
	    echo "Exiting..."
	    exit 0
	fi

	echo "Dir: $wallpaper_dir"
done



full_path="$wallpaper_dir/$selected_option"

echo "$full_path"

# Copying the image file to .cache fot hyprpaper
wal -q -i "$full_path" --saturate 0.6

hyprpaper unload all 
hyprctl hyprpaper preload "$full_path" 
hyprctl hyprpaper wallpaper ", $full_path" 

/home/aditya/.config/waybar/scripts/launch.sh &

killall dunst
dunst -c /home/aditya/.config/dunst/dunstrc &

source /home/aditya/.cache/wal/colors.sh
cp "$wallpaper" /home/aditya/.cache/current_background_image

echo "Copying $wallpaper to /home/aditya/.cache/current_background_image"

echo "Wallpaper set: $selected_option"


