coul=( "Dred" "Dblue" "Dcyan" "Dpurple" "Dyellow" "Dgreen" )
rand=$(( $RANDOM % ${#coul[*]} )) # random number between 0 and length of coul
border="${coul[$rand]}" # Pick one random color
echo "
! Gruvbox
#define Dblack    #282828
#define Lblack 		#928374
#define Dred 			#cc241d
#define Lred 			#fb4934
#define Dgreen 		#98971a
#define Lgreen 		#b8bb26
#define Dyellow 	#d79921
#define Lyellow 	#fabd2f
#define Dblue 		#458588
#define Lblue 		#83a598
#define Dpurple 	#b16286
#define Lpurple 	#d3869b
#define Dcyan 		#689d6a
#define Lcyan 		#8ec07c
#define Dgrey 		#a89984
#define Lgrey 		#ebdbb2
#define bg				Dblack
#define fg				Lgrey

! -----------------------------------------------------------!
!                         Rofi                               !
! -----------------------------------------------------------!
rofi.color-enabled: true
!                  bg       border  separator
rofi.color-window: bg, 			$border, 	$border

!                  bg       fg      bg-alt   	hl-bg    	hl-fg
rofi.color-normal: bg, 			fg, 		bg, 			bg, 			$border
rofi.color-active: Dyellow, bg, 		Dyellow, 	Lyellow, 	bg
rofi.color-urgent: Dred, 		bg, 		Dred, 		Lred, 		bg

rofi.opacity: 30
!border width
*bw:      2
rofi.separator-style: solid
rofi.hide-scrollbar: true
rofi.lines: 5
rofi.width: 40
rofi.location: 0







! ---------------------------------------------------!
!                 URXVT Settings                     !
! ---------------------------------------------------!
! URxvt.font: xft:75-yes-terminus:size=10
URxvt.font: xft:mononoki-regular:size=11
URxvt..cursorColor: Dcyan
URxvt.letterSpace: -1
Xft.dpi: 96
Xft.antialias: true
Xft.hinting: true
Xft.rgba: rgb
Xft.autohint: false
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault
Xcursor.theme: Chameleon-Pearl-Regular-0.5
Xcursor.size:  0
URxvt.depth: 32
URxvt*scrollBar:                      false
!URxvt*mouseWheelScrollPage:           false
URxvt*cursorBlink:                    true
!URxvt*background:                     #121212
!URxvt*foreground:                     #fefefe
!URxvt*saveLines:                      5000
URxvt.url-launcher: 	/usr/bin/qutebrowser

! ----------------------------------------------!
!                    Colors                     !
! ----------------------------------------------!

! Gruvbox
*background: 	Dblack
*foreground: 	Lgrey
*color0:  		Dblack
*color8:  		Lblack
*color1:  		Dred
*color9:  		Lred
*color2:  		Dgreen
*color10: 		Lgreen
*color3:  		Dyellow
*color11: 		Lyellow
*color4:  		Dblue
*color12: 		Lblue
*color5:  		Dpurple
*color13: 		Lpurple
*color6:  		Dcyan
*color14: 		Lcyan
*color7:  		Dgrey
*color15: 		Lgrey" > $HOME/.Xresources
