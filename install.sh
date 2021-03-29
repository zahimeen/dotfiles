#!/bin/env bash

echo "############################"
echo "# Updating System Packages #"
echo "############################"

sudo pacman --noconfirm -Syu

echo "##################"
echo "# Installing Yay #"
echo "##################"

sudo pacman -Syu --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

echo "###############################"
echo "# Installing Graphics Support #"
echo "###############################"

yay -Syu xorg mesa xf86-video-intel

echo "###################################"
echo "# Installing Qtile Window Manager #"
echo "###################################"

yay -Syu picom lightdm lightdm-gtk-greeter python-pip

pip install xcffib
pip install --no-cache-dir cairocffi
pip install dbus-next
pip install psutil
yay -Syu qtile

echo "########################"
echo "# Installing Utilities #"
echo "########################"

yay -Syu alacritty dmenu brave-bin neovim-nightly-bin feh volumeicon blueberry discord nodejs npm yay zsh starship exa ripgrep xsel nerd-fonts-hack ttf-ubuntu-font-family pcmanfm
pip install pynvim
npm install -g neovim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "#######################"
echo "# Moving Config Files #"
echo "#######################"

mv ~/Dotfiles/.config/nvim/ ~/.config
mv ~/Dotfiles/.config/alacritty/ ~/.config
mv ~/Dotfiles/.config/qtile/ ~/.config
mv ~/Dotfiles/.config/picom.conf ~/.config
mv ~/Dotfiles/.zshrc ~
mv ~/Dotfiles/.bashrc ~
mv ~/Dotfiles/Wallpapers ~

echo "#############################"
echo "# Enabling Certain Services #"
echo "#############################"

systemctl enable lightdm

echo "#############################################################"
echo "Well done, we have now finished the installation"
echo "You just have to restart your computer now"
echo ""
echo "Remember to set zsh as your default shell with chsh"
