killall dunst
function get_color(){
	res=$(xrdb -q | grep "$1:" | cut -d "#" -f 2)
	echo "#"$res
}

color1=$(get_color color1)
color2=$(get_color color2)
background=$(get_color background)
foreground=$(get_color foreground)

cfr=$color1
nfr=$background
lfr=$color2

cb=$background
nb=$background
lb=$background

cf=$foreground
nf=$foreground
lf=$foreground

dunst \
	-lfr $lfr -nfr $nfr -cfr $cfr\
	-lb $lb -nb $nb -cb $cb \
	-lf $lf -nf $nf -cf $cf &
