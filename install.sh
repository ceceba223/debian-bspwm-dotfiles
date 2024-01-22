#!/bin/bash

# install the most basic denpendencies
#sudo apt install bspwm sxhkd polybar picom dmenu dunst nitrogen thunar kitty xterm

# Set the base directory as a variable 
INSTALL_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
echo $INSTALL_DIR

#create the  config files in .config and link them to the ones in the reposetory
if [ ! -d "$HOME/.config" ]; then
	mkdir $HOME/.config
fi
cd $HOME/.config

if [ ! -d "$HOME/.config/bspwm" ]; then
	mkdir bspwm sxhkd polybar picom dunst
fi

ln -s $INSTALL_DIR/bspwm/bspwmrc $HOME/.config/bspwm/bspwmrc
ln -s $INSTALL_DIR/sxhkd/sxhkdrc $HOME/.config/sxhkd/sxhkdrc
ln -s $INSTALL_DIR/picom/picom.conf $HOME/.config/picom/picom.conf
ln -s $INSTALL_DIR/polybar/config.ini $HOME/.config/polybar/config.ini
ln -s $INSTALL_DIR/dunst/dunstrc $HOME/.config/dunst/dunstrc

# Install and setup xorg & xinit
#sudo apt install xorg xinit
#ln -s $INSTALL_DIR/.xinitrc $HOME/.xinitrc

# Install and setup the Ly Display manager
#sudo apt install build-essential libpam0g-dev libxcb-xkb-dev

#if [ ! -d "$HOME/packages" ]; then
#	mkdir $HOME/packages
#fi
#cd $HOME/packages

#git clone --recurse-submodules "https://github.com/fairyglade/ly.git"

#cd ly
#make
#sudo make install installsystemd
#sudo systemctl enable ly.service
#sudo systemctl disable getty@tty2.service

# Link .gitconfig file to home directory
ln -s $INSTALL_DIR/.gitconfig $HOME/.gitconfig
