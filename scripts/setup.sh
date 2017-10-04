#!/usr/bin/env bash

case `uname -r` in
	*ARCH)
		sudo yaourt -S gvfs lightdm-gtk-greeter lightdm-gtk-greeter-settings claws-mail evince mupdf pavucontrol pulseaudio pulseaudio-alsa libcanberra-{pulse,gstreamer} system-config-printer ttf-font-awesome ttf-mononoki nmap gnome-keyring net-tools rxvt-unicode zsh dunst feh rofi firefox chromium qutebrowser tmux liferea thunar i3lock i3-gaps network-manager-applet pass zathura
		;;
	*gentoo*)
		# TODO: figure out USE flags
		sudo emerge -q pass i3 rxvt-unicode zsh dunst feh rofi firefox qutebrowser tmux liferea thunar i3lock nm-applet zathura
esac

mkdir -p $HOME/.config/{i3,dunst,polybar}

ln -sf $HOME/.dotfiles/i3/config $HOME/.config/i3/config
ln -sf $HOME/.dotfiles/Xresources $HOME/.Xresources


git clone --recursive https://github.com/changs/slimzsh.git ~/.dotfiles/zsh/
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc

ln -sf /home/doshirae/.dotfiles/tmux.conf /home/doshirae/.tmux.conf

curl -fLo ~/.dotfiles/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf /home/doshirae/.dotfiles/vim /home/doshirae/vim
ln -sf /home/doshirae/.dotfiles/vimrc /home/doshirae/.vimrc
# ln -sf /home/doshirae/.dotfiles/muttrc /home/doshirae/.muttrc

ln -sf /home/doshirae/.dotfiles/xinitrc /home/doshirae/.xinitrc
ln -sf /home/doshirae/.dotfiles/dunstrc ~/.config/dunst/dunstrc
ln -sf /home/doshirae/.dotfiles/i3/polybar/polybar.conf /home/doshirae/.config/polybar/config
