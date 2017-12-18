#!/usr/bin/env bash

# packages ==>
function packages(){
	case `uname -r` in
		*ARCH)
			sudo yaourt -S gvfs lightdm-gtk-greeter lightdm-gtk-greeter-settings evince mupdf pavucontrol pulseaudio pulseaudio-alsa libcanberra-{pulse,gstreamer} system-config-printer ttf-font-awesome ttf-mononoki nmap gnome-keyring net-tools rxvt-unicode zsh dunst feh rofi firefox chromium qutebrowser tmux liferea thunar i3lock i3-gaps network-manager-applet pass zathura lxappearance wget imagemagick xdotool polybar-git bmenu urxvt-perls gvim rsync rofi-pass
			;;
		*gentoo*)
			# TODO: figure out USE flags
			# Regarder si c'est bien : sshpass
			# Pas dispo : mononoki
			# trouver remplacement : gnome-keyring
			# Build from source : polybar
			# USE : libcanberra → pulseaudio, gstreamer
			# USE : pulseaudio → alsa-plugin
			sudo emerge -q gnome-base/gvfs app-admin{pass,qtpass} x11-misc/{lightdm-gtk-greeter,dunst,rofi,i3lock,pcmanfm, xdotool, urxvt-perls} app-text/{evince,mupdf,zathura{,-pdf-poppler}} media-sound/{pavucontrol,pulseaudio} media-fonts/fontawesome net-analyzer/nmap sys-apps/net-tools x11-terms/rxvt-unicode app-shells/{zsh,gentoo-zsh-completions} media-gfx/{imagemagick,feh} www-client/{firefox,qutebrowser,chromium,surf} x11-wm/i3 app-misc/tmux net-news/liferea xfce-base/thunar gnome-extra/nm-applet lxde-base/lxappearance net-misc/wget
	esac
}
# <==

# xdg ==>
function xdg(){
	mkdir -p $HOME/.config/{i3,dunst,polybar}
	ln -sf $HOME/.dotfiles/xdg/dunstrc $HOME/.config/dunst/dunstrc
	ln -sf $HOME/.dotfiles/xdg/compton.conf $HOME/.config/compton.conf
	ln -sf $HOME/.dotfiles/xdg/redshift.conf  $HOME/.config/redshift.conf

	ln -sf $HOME/.dotfiles/i3/config $HOME/.config/i3/config
	ln -sf $HOME/.dotfiles/i3/polybar.conf $HOME/.config/polybar/config
}
# <==

# zsh ==>
function zsh(){
	git clone --recursive https://github.com/changs/slimzsh.git ~/.zsh/slimzsh
	git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	wget https://raw.githubusercontent.com/zsh-users/zsh-history-substring-search/master/zsh-history-substring-search.zsh -O ~/.zsh/zsh-history-substring-search.zsh
	ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
}
# <==

# vim ==>
function vim(){
	mkdir -p $HOME/.vim/{undo,tmp}
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -sf $HOME/.dotfiles/vimrc $HOME/.vimrc
	echo "You should run vim +PlugInstall"
}
# <==

# other ==>
function other(){
	ln -sf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
	ln -sf $HOME/.dotfiles/X/xinitrc $HOME/.xinitrc
	ln -sf $HOME/.dotfiles/X/Xresources $HOME/.Xresources
	ln -sf $HOME/.dotfiles/X/XCompose $HOME/.XCompose
	ln -sf $HOME/.dotfiles/ssh-config $HOME/.ssh/config
}
# <==

function all(){
	packages
	xdg
	zsh
	vim
	other
}

if $@ 2> /dev/null; then
	$@
else
	echo "Impossible. Installation possible de : packages, xdg, zsh, vim, other ou all"
fi
