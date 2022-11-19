#!/bin/bash

PROGDIR=$HOME/Pictures/wallpaper

if [ $DESKTOP_SESSION = "gnome" ] 
then
    $PROGDIR/random_wallpaper_gnome.sh
elif [ $DESKTOP_SESSION = "cinnamon" ] 
then
    $PROGDIR/random_wallpaper_cinnamon.sh
fi

