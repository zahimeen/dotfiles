#!/bin/env bash

echo ""
echo "############################################"
echo "# Updating and Resfreshing System Packages #"
echo "############################################"
echo ""

sudo pacman --noconfirm -Fy
sudo pacman --noconfirm -Syu

echo ""
echo "##################"
echo "# Installing Yay #"
echo "##################"
echo ""

sudo pacman --noconfirm -Syu git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

echo ""
echo "###############################"
echo "# Installing Graphics Drivers #"
echo "###############################"
echo ""

yay --noconfirm -Syu xorg xorg-xinit xorg-server mesa xf86-video-intel vulkan-intel intel-ucode

echo ""
echo "############################"
echo "# Installing Audio Support #"
echo "############################"
echo ""

yay --noconfirm -Syu alsa alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth volumeicon
pulseaudio -D

echo ""
echo "################################"
echo "# Installing Bluetooth Support #"
echo "################################"
echo ""

yay --noconfirm -Syu bluez bluez-utils blueberry

echo ""
echo "########################"
echo "# Installing Utilities #"
echo "########################"
echo ""

yay --noconfirm -Syu alacritty brave-bin pcmanfgm element-desktop-nightly-bin xwallpaper xsel nerd-fonts-hack\
    nerd-fonts-jetbrains-mono network-manager-applet neofetch

echo ""
echo "#####################"
echo "# Installing Neovim #"
echo "#####################"
echo ""

yay --noconfirm -Syu neovim-nightly-bin neovide nodejs npm
pip install pynvim
npm -i -g neovim

mv ~/Dotfiles/.config/nvim ~/.config

echo ""
echo "##################"
echo "# Installing ZSH #"
echo "##################"
echo ""

yay --noconfirm -Syu zsh starship devour exa ripgrep bat 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mv ~/Dotfiles/.zshrc ~
mv ~/Dotfiles/.bashrc ~

echo ""
echo "#######################"
echo "# Moving Config Files #"
echo "#######################"
echo ""

mv ~/Dotfiles/.config/alacritty ~/.config
mv ~/Dotfiles/.config/picom.conf ~/.config
mv ~/Dotfiles/.config/starship.toml ~/.config

echo ""
echo "#############################"
echo "# Enabling Certain Services #"
echo "#############################"
echo ""

systemctl enable lightdm

echo ""
echo "#########################"
echo "# Finished Installation #"
echo "#########################"
echo ""
