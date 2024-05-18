#!/bin/bash

read_theme() {
    theme_file="$HOME/.config/hypr/theme.txt"
    if [ -f "$theme_file" ]; then
        theme=$(<"$theme_file")
        echo "$theme"
    else
        echo "Error: the theme file is corrupted or doesn't exist"
        exit 1
    fi
}

hyprpaper_shuffle(){
    while true; do
        theme=$(read_theme)
        wallpapers_dir="/Wallpapers/"
        full_path="$HOME$wallpapers_dir$theme/"
        screen_name="eDP-1"
        screen2_name="HDMI-A-1"
        echo "$full_path"
        IFS='/' read -ra elements <<< "$full_path"
        directory_contents=($(ls "$full_path"))
        
        random_index=$(( RANDOM % ${#directory_contents[@]} ))
        random_element="${directory_contents[random_index]}"
        random_element_full_path="$full_path$random_element"
        echo "$random_element_full_path"
        hyprctl hyprpaper preload "$random_element_full_path"
        hyprctl hyprpaper wallpaper "$screen_name,$random_element_full_path"
        hyprctl hyprpaper wallpaper "$screen2_name,$random_element_full_path"
        sleep $((15 * 60))
    done
}

hyprpaper_shuffle

