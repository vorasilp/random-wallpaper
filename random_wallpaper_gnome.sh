#!/bin/bash

dark_mode=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ "$dark_mode" = "'prefer-dark'" ]
then
    uri_loc="picture-uri-dark"
else
    uri_loc="picture-uri"
fi

current=$(gsettings get org.gnome.desktop.background $uri_loc)

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

change_background_cmd="gsettings set org.gnome.desktop.background $uri_loc"

# # set the wallpaper
eval $change_background_cmd $new_background

