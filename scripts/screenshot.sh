FORMAT="%Y-%m-%d %H:%M:%S"
DATE=$(date +"$FORMAT")
case $1 in
	full)
		scrot "$FORMAT [Full].png" -ze 'mv "$f" ~/Pictures/Screenshots/'
		notify-send 'Saved screenshot' "$DATE [Full].png"
		;;
	area)
		sleep 1
		scrot "$FORMAT [Area].png" -zse 'mv "$f" ~/Pictures/Screenshots/'
		notify-send 'Saved screenshot' "$DATE [Area].png"
		;;
	window)
		scrot "$FORMAT [Window].png" -zue 'mv "$f" ~/Pictures/Screenshots/'
		notify-send 'Saved screenshot' "$DATE [Window].png"
		;;
esac
