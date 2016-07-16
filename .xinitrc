#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# Here Xfce is kept as default
session=${1:-i3}

case $session in
   i3|i3wm           ) exec i3;;
   xfce|xfce4        ) exec startxfce4;;
  # No known session, try to run it as command
		    *) exec $1;;
esac
