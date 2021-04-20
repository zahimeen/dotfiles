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

sudo pacman --noconfirm -S git base-devel
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

yay --noconfirm -S xorg xorg-xinit xorg-server mesa xf86-video-intel vulkan-intel intel-ucode

echo ""
echo "############################"
echo "# Installing Audio Support #"
echo "############################"
echo ""

yay --noconfirm -S alsa alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth volumeicon pavucontrol
pulseaudio -D

echo ""
echo "################################"
echo "# Installing Bluetooth Support #"
echo "################################"
echo ""

yay --noconfirm -S bluez bluez-utils blueberry

echo ""
echo "########################"
echo "# Installing Utilities #"
echo "########################"
echo ""

yay --noconfirm -S kitty brave-bin pcmanfm element-desktop-nightly-bin xwallpaper xsel nerd-fonts-fira-code\
    network-manager-applet neofetch tree ranger lxappearance qt5ct rofi

echo""
echo"####################"
echo"# Installing Qtile #"
echo"####################"
echo""

yay --noconfirm -S picom qtile python-pip
pip install psutil

cp -r ~/Dotfiles/.config/qtile ~/.config

echo""
echo"#####################"
echo"# Installing LightDM #"
echo"#####################"
echo""

yay --noconfirm -S lightdm lightdm-gtk-greeter
systemctl enable lightdm.service

echo ""
echo "#####################"
echo "# Installing Neovim #"
echo "#####################"
echo ""

yay --noconfirm -S neovim-nightly-bin neovide nodejs npm
pip install pynvim
npm -i -g neovim

cp -r ~/Dotfiles/.config/nvim ~/.config

echo ""
echo "##################"
echo "# Installing ZSH #"
echo "##################"
echo ""

yay --noconfirm -S zsh starship devour exa ripgrep bat 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp -r ~/Dotfiles/.zshrc ~
cp -r ~/Dotfiles/.bashrc ~

echo ""
echo "#######################"
echo "# Moving Config Files #"
echo "#######################"
echo ""

cp ~/Dotfiles/.config/wall.jpeg ~/.config
cp -r ~/Dotfiles/.config/kitty ~/.config
cp -r ~/Dotfiles/.config/rofi ~/.config
cp -r ~/Dotfiles/.config/picom.conf ~/.config
cp -r ~/Dotfiles/.config/starship.toml ~/.config

echo ""
echo "#########################"
echo "# Finished Installation #"
echo "#########################"
echo ""
