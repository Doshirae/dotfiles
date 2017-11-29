#!/usr/bin/env bash

case `uname -r` in
	*ARCH)
		sudo yaourt -S gvfs lightdm-gtk-greeter lightdm-gtk-greeter-settings evince mupdf pavucontrol pulseaudio pulseaudio-alsa libcanberra-{pulse,gstreamer} system-config-printer ttf-font-awesome ttf-mononoki nmap gnome-keyring net-tools rxvt-unicode zsh dunst feh rofi firefox chromium qutebrowser tmux liferea thunar i3lock i3-gaps network-manager-applet pass zathura lxappearance wget imagemagick xdotool
		;;
	*gentoo*)
		# TODO: figure out USE flags
		# Regarder si c'est bien : sshpass
		# Pas dispo : mononoki
		# trouver remplacement : gnome-keyring
		# USE : libcanberra → pulseaudio, gstreamer
		# USE : pulseaudio → alsa-plugin
		sudo emerge -q gnome-base/gvfs app-admin{pass,qtpass} x11-misc/{lightdm-gtk-greeter,dunst,rofi,i3lock,pcmanfm} app-text/{evince,mupdf,zathura{,-pdf-poppler}} media-sound/{pavucontrol,pulseaudio} media-fonts/fontawesome net-analyzer/nmap sys-apps/net-tools x11-terms/rxvt-unicode app-shells/{zsh,gentoo-zsh-completions} media-gfx/{imagemagick,feh} www-client/{firefox,qutebrowser,chromium,surf} x11-wm/i3 app-misc/tmux net-news/liferea xfce-base/thunar gnome-extra/nm-applet lxde-base/lxappearance net-misc/wget
esac

# XDG config
mkdir -p $HOME/.config/{i3,dunst,polybar}
ln -sf $HOME/.dotfiles/i3/config $HOME/.config/i3/config
ln -sf $HOME/.dotfiles/dunstrc $HOME/.config/dunst/dunstrc
ln -sf $HOME/.dotfiles/i3/polybar/polybar.conf $HOME/.config/polybar/config

# zsh
git clone --recursive https://github.com/changs/slimzsh.git ~/.zsh/slimzsh
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
wget https://raw.githubusercontent.com/zsh-users/zsh-history-substring-search/master/zsh-history-substring-search.zsh -O ~/.zsh/zsh-history-substring-search.zsh
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc

# vim
mkdir -p $HOME/.vim/{undo,tmp}
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $HOME/.dotfiles/vimrc $HOME/.vimrc
vim +PlugInstall

# Other
ln -sf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -sf $HOME/.dotfiles/xinitrc $HOME/.xinitrc
ln -sf $HOME/.dotfiles/Xresources $HOME/.Xresources
