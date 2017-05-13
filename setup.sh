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
  if [ ! -d nvim/ ]; then
    mkdir nvim/ 
  fi
fi

ln -s $HOME/.dotfiles/vim $HOME/.vim/

ln -s $HOME/.dotfiles/compton.conf $HOME/.config/compton.conf
ln -s $HOME/.dotfiles/dunstrc  $HOME/.config/dunst/dunstrc

ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/Xresources $HOME/.Xresources
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc


ln -s $HOME/.dotfiles/i3/config $HOME/.config/i3/config
ln -s $HOME/.dotfiles/i3/i3status.conf $HOME/.config/i3status/config
