#!/usr/bin/env bash

if [ ! -d $HOME/.config ]; then
  mkdir $HOME/.config 
  cd $HOME/.config
  if [ ! -d dunst/ ]; then
    mkdir dunst/ 
  fi
  if [ ! -d i3/ ]; then
    mkdir i3/ 
  fi
  if [ ! -d i3status/ ]; then
    mkdir i3status/ 
  fi
fi

ln -s /home/doshirae/.dotfiles/compton.conf /home/doshirae/.config/compton.conf
ln -s /home/doshirae/.dotfiles/dunstrc  /home/doshirae/.config/dunst/dunstrc

ln -s /home/doshirae/.dotfiles/tmux.conf /home/doshirae/.tmux.conf
ln -s /home/doshirae/.dotfiles/Xresources /home/doshirae/.Xresources
ln -s /home/doshirae/.dotfiles/vimrc /home/doshirae/.vimrc
ln -s /home/doshirae/.dotfiles/zshrc /home/doshirae/.zshrc


ln -s /home/doshirae/.dotfiles/i3/config /home/doshirae/.config/i3/config
ln -s /home/doshirae/.dotfiles/i3/i3status.conf /home/doshirae/.config/i3status/config

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir ~/.vim/colors
wget www.vim.org/scripts/download_script.php?src_id=9750 -O ~/.vim/colors/molokai.vim
