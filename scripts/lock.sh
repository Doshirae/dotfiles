#!/usr/bin/env sh

revert() {
    xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms dpms 10 10 10

ICON=$HOME/.dotfiles/i3/birb-lock.png
TMPBG=/tmp/screen.png
scrot /tmp/screen.png
convert $TMPBG -scale 10% -scale 1000% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -u -i $TMPBG

revert
