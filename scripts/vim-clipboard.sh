TMPFILE=$(mktemp)
urxvt -title "vim-clipboard" -geometry "80x24" -e zsh -c "vim --nofork $TMPFILE"
cat $TMPFILE | xclip -selection clipboard
