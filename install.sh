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

yay --noconfirm -Syu xorg mesa xf86-video-intel vulkan-intel intel-ucode

echo ""
echo "###################################"
echo "# Installing Qtile Window Manager #"
echo "###################################"
echo ""

yay --noconfirm -Syu picom lightdm lightdm-gtk-greeter python-pip qtile
pip install psutil

mv ~/Dotfiles/.config/qtile ~/.config

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
echo "########################"
echo "# Installing Utilities #"
echo "########################"
echo ""

yay --noconfirm -Syu alacritty librewolf-bin pcmanfm element-desktop-nightly-bin xwallpaper blueberry volumeicon xsel nerd-fonts-hack\
    nerd-fonts-jetbrains-mono pavucontrol network-manager-applet neofetch

echo ""
echo "#######################"
echo "# Moving Config Files #"
echo "#######################"
echo ""

mv ~/Dotfiles/.config/alacritty ~/.config
mv ~/Dotfiles/.config/picom.conf ~/.config
mv ~/Dotfiles/.config/starship.toml ~/.config

echo "#############################"
echo "# Enabling Certain Services #"
echo "#############################"

systemctl enable lightdm

echo ""
echo "#########################"
echo "# Finished Installation #"
echo "#########################"
echo ""
