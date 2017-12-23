#!/usr/bin/env sh

revert() {
	xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms dpms 30 30 30
cd ~/.dotfiles/i3/locks

ICON=`ls | sort -R |tail -1`
TMPBG=/tmp/screen.png
scrot /tmp/screen.png
convert $TMPBG -scale 10% -scale 1000% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG

BLUE=`xrdb -query | grep "color4:" | cut -d : -f 2 | cut -c 3-`"FF"
RED=`xrdb -query | grep "color1:" | cut -d : -f 2 | cut -c 3-`"FF"
RED_TRANSPARENT=`xrdb -query | grep "color1:" | cut -d : -f 2 | cut -c 3-`"30"
GREEN=`xrdb -query | grep "color2:" | cut -d : -f 2 | cut -c 3-`"FF"
PURPLE=`xrdb -query | grep "color5:" | cut -d : -f 2 | cut -c 3-`"FF"
CYAN=`xrdb -query | grep "color6:" | cut -d : -f 2 | cut -c 3-`"FF"
GREY=`xrdb -query | grep "color7:" | cut -d : -f 2 | cut -c 3-`"FF"

SIZE=30

i3lock -n -k -e -i $TMPBG \
	--keyhlcolor=$BLUE --bshlcolor=$PURPLE --separatorcolor=$BLUE \
	--insidecolor=00000000 --ringcolor=00000000 \
	--insidevercolor=00000000 --ringvercolor=$GREEN \
	--insidewrongcolor=$RED_TRANSPARENT --ringwrongcolor=$RED \
	--line-uses-inside \
	--indpos="x+w/2:y+h/2" \
	--radius=250 --veriftext="" --wrongtext="" --ring-width=10 \
	--timecolor=$PURPLE \
	--datecolor=$GREY --datestr="%A %e %b %Y"\
	--timepos="ix-cw/2:iy-300-ch/2" \
	--bar-indicator --bar-base-width $SIZE --bar-max-height $SIZE --bar-step $SIZE --bar-periodic-step $SIZE --bar-direction 1 --bar-position h


revert
