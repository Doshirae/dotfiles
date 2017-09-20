#!/usr/bin/env bash

yaourt -S gvfs lightdm-gtk-greeter lightdm-gtk-greeter-settings claws-mail evince mupdf pavucontrol pulseaudio pulseaudio-alsa libcanberra-{pulse,gstreamer} system-config-printer
yaourt -S ttf-font-awesome ttf-mononoki nmap gnome-keyring net-tools
yaourt -S rxvt-unicode zsh dunst feh rofi
yaourt -S claws-mail firefox chromium qutebrowser tmux liferea thunar i3lock i3-gaps

ln -sf $HOME/.dotfiles/i3/config $HOME/.config/i3/config
ln -sf $HOME/.dotfiles/Xresources $HOME/.Xresources


git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc

ln -sf /home/doshirae/.dotfiles/tmux.conf /home/doshirae/.tmux.conf

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
ln -sf /home/doshirae/.dotfiles/vim /home/doshirae/vim
ln -sf /home/doshirae/.dotfiles/vimrc /home/doshirae/.vimrc
ln -sf /home/doshirae/.dotfiles/muttrc /home/doshirae/.muttrc

ln -sf /home/doshirae/.dotfiles/xinitrc /home/doshirae/.xinitrc
ln -sf /home/doshirae/.dotfiles/dunstrc ~/.config/dunst/dunstrc
ln -sf /home/doshirae/.dotfiles/i3/polybar/polybar.conf /home/doshirae/.config/polybar/config

