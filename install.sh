#!/bin/bash

# install the most basic denpendencies
#sudo apt install bspwm sxhkd polybar picom dmenu dunst nitrogen thunar kitty xterm unzip xorg xinit rofi 

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
ln -s $INSTALL_DIR/polybar $HOME/.config/
ln -s $INSTALL_DIR/dunst/dunstrc $HOME/.config/dunst/dunstrc
ln -s $INSTALL_DIR/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -s $INSTALL_DIR/bash/.bashrc $HOME/.bashrc

# Setup xorg & xinit
#ln -s $INSTALL_DIR/.xinitrc $HOME/.xinitrc

# Install and setup the Ly Display manager
#sudo apt install build-essential libpam0g-dev libxcb-xkb-dev

#if [ ! -d "$HOME/packages" ]; then
#	mkdir $HOME/packages
#fi
#cd $HOME/packages

#git clone --recurse-submodules "https://github.com/fairyglade/ly.git"

#cd ly
#make"
#sudo make install installsystemd
#sudo systemctl enable ly.service
#sudo systemctl disable getty@tty2.service

# Link .gitconfig file to home directory
ln -s $INSTALL_DIR/.gitconfig $HOME/.gitconfig

# Create default Folders (Documents, Dowloads, Pictures)
cd $HOME
folder_list=( "./Downloads" "./Documents" "./Pictures" )
for value in "${folder_list[@]}"
do
	if [ ! -d $HOME"/"$value ]; then
		mkdir $value
	fi
done

# Install MatianMono Nerd Font
cd $HOME/Downloads
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/MartianMono.zip"
mkdir /usr/share/fonts/truetype/martian
sudo unzip $HOME/Downloads/MartianMono.zip -d /usr/share/fonts/truetype/martian/

# Download DistroTubes Wallpaper repository
cd $HOME/Pictures
git clone --depth 1 https://gitlab.com/dwt1/wallpapers.git

# Install rofi
ln -s /home/hagen/debian-bspwm-dotfiles/rofi /home/hagen/.config/

# Polybar config & Dependencies
sudo apt install playerctl python3.11-distutils

cd $HOME/packages
git clone https://github.com/noctuid/zscroll
cd zscroll
sudo python3 setup.py install

# Install & Setup starship bash promt
curl -sS https://starship.rs/install.sh | sh
ln -s /home/hagen/debian-bspwm-dotfiles/bash/starship.toml /home/hagen/.config/starship.toml
