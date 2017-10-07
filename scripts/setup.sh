#!/usr/bin/env bash

case `uname -r` in
	*ARCH)
		sudo yaourt -S gvfs lightdm-gtk-greeter lightdm-gtk-greeter-settings claws-mail evince mupdf pavucontrol pulseaudio pulseaudio-alsa libcanberra-{pulse,gstreamer} system-config-printer ttf-font-awesome ttf-mononoki nmap gnome-keyring net-tools rxvt-unicode zsh dunst feh rofi firefox chromium qutebrowser tmux liferea thunar i3lock i3-gaps network-manager-applet pass zathura lxappearance wget
		;;
	*gentoo*)
		# TODO: figure out USE flags
		sudo emerge -q pass i3 rxvt-unicode zsh dunst feh rofi firefox qutebrowser tmux liferea thunar i3lock nm-applet zathura wget
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
