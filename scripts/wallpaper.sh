#!/usr/bin/env bash

# echo $choices[1]

# wallpaper=`echo $args | awk -F"|" '{print $1}'`


ls /home/doshirae/Pictures/Wallpapers/Choices |sort -R |tail -1 |while read file; do
	feh --bg-scale /home/doshirae/Pictures/Wallpapers/Choices/"$file"
done
