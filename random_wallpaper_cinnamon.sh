#!/bin/bash

current=$(gsettings get org.cinnamon.desktop.background picture-uri)
opacity=$(gsettings get org.cinnamon.desktop.background picture-opacity)
options=$(gsettings get org.cinnamon.desktop.background picture-options)

DIR="$HOME/Pictures/wallpaper"
PIC=("$DIR"/*.jpg)

new=$(printf '%s\n' "${PIC[@]@Q}" | shuf -n1 | tr -d "'")
new_background=$(printf "file://%q" "$new")

while [ "$current" = "$new_background" ]
do
    new=$(printf '%s\n' "${PIC[@]@Q}" | shuf -n1 | tr -d "'")
    new_background=$(printf "file://%q" "$new")
done

echo change background to $new_background

change_background_cmd="gsettings set org.cinnamon.desktop.background picture-uri"

# set the wallpaper
eval $change_background_cmd $new_background
gsettings set org.cinnamon.desktop.background picture-opacity ${opacity}
gsettings set org.cinnamon.desktop.background picture-options ${options}

# gsettings set org.gnome.desktop.background picture-uri 
