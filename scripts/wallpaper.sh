#!/usr/bin/env bash

ls /home/doshirae/Pictures/Wallpapers/Choices | sort -R |tail -1 | while read file; do
	feh --bg-scale /home/doshirae/Pictures/Wallpapers/Choices/"$file"
done
