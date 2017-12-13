#!/usr/bin/env bash


ls /home/doshirae/Pictures/Wallpapers/Choices | sort -R |tail -1 | while read file; do
case $file in
	*Rosace*)
		feh --bg-tile /home/doshirae/Pictures/Wallpapers/Choices/"$file"
		;;
	*)
		feh --bg-scale /home/doshirae/Pictures/Wallpapers/Choices/"$file"
		;;
esac
done
