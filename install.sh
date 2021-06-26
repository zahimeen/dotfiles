# FONT STYLING #

bold=$(tput bold)
italic=$(tput sitm) 
reset=$(tput sgr0)

echo_bold () { 
    echo "${bold}$1${reset}" 
    echo ""
}
echo_italic () { 
    echo "${italic}$1${reset}" 
}

clear
echo ""
echo_bold "Deploying and Installing Configurations"
echo_italic "Disclaimer:"
echo_italic "1) When running this script, make sure you are in the folder, and that the folder is in your home directory."
echo_italic "2) If you already have a few configurations of your own (that is in my dotfiles aswell), they will be overrided. Create backups!"
echo_italic "3) If you are not using an Arch based distribution, this script is bound to break. You would have to manually deploy the configs,
   but their is a chance that some configs won't work without Arch based distributions."
echo ""

###  PROMPTING USER IF THEY WANT TO CONTINUE THE INSTALL  ###

read -r -p "${italic}Are you sure you want to continue? [y/N]: ${reset}" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo ""
else
    exit 0
fi

###  UPDATING AND UPGRADING  ###

echo_bold "Updating Packages"
sudo pacman -Syyu
echo ""

###  INSTALLING PARU (PACKAGE MANAGER FOR AUR)  ###

echo_bold "Installing 'paru' (Package Manager for AUR)"
echo ""
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
echo ""

###  INSTALLING XORG AND DRIVERS  ###

echo_bold "Installing Xorg and Mesa Drivers"
paru -S --needed xorg mesa
echo ""

###  INSTALLING MY DESKTOP ENVIRONMENT (XMONAD)  ###

echo_bold "Installing My 'Desktop Environment' (XMonad)"
paru -S --needed xmonad xmonad-contrib xwallpaper xbrightness polybar picom-jonaburg-git stow ttf-iosevka-custom-git thunar
stow xmonad
stow polybar
stow picom
echo ""

###  INSTALLING ROFI  (APPLICATION MENU)  ###

echo_bold "Installing Rofi"
paru -S --needed rofi
stow rofi
echo ""

###  INSTALLING KITTY AND ALACRITTY (TERMINAL)  ###

echo_bold "Installing Kitty and Alacritty (Terminals)"
paru -S --needed kitty alacritty nerd-fonts-ubuntu-mono
stow kitty
stow alacritty
echo ""

###  INSTALLING ZSH AND BASH (SHELL)  ###

echo_bold "Installing ZSH and Replacing '.bashrc' (Shell)"
paru -S --needed zsh zsh-completions starship bat ripgrep exa tree
stow zsh
stow bash
echo ""

###  INSTALLING NEOVIM (TEXT EDITOR)  ###

echo_bold "Installing Noevim (Text Editor)"
paru -S --needed unzip npm
git clone https://github.com/zahin-muhaimeen/nvim.git $HOME/.config/
$HOME/.config/nvim/utils/bin/install-latest-neovim
echo ""

###  GTK THEME  ###

echo_bold "GTK and Icon Themes"
paru -S --needed dracula-gtk-theme oreo-nord-cursors-git ttf-ubuntu-font-family lxappearance
echo ""
echo_italic "Use the 'lxappearance' application to set the theme, icons, cursor and fonts."
echo ""

###  AUDIO  ###

echo_bold "Audio Support"
paru -S pipewire pipewire-pulse pipewire-alsa pipewire-jack

###  BLUETOOTH  ###

echo_bold "Bluetooth Support"
paru -S bluez bluez-libs blueman

###  DEPLOY X FILES  ###

echo_bold "Deploy X Files"
stow Xorg

###  EXTRA APPLICATIONS  ###

echo_bold "Extra Applications"
echo_italic "I personally use this software and is productive for my workflow."
echo_italic "The applications feature the Brave Browser, LibreOffice, Spotify and More."

read -r -p "${italic}Would you like to install some of these extra applications? [y/N]: ${reset}" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    paru -S --needed brave-bin discord element-desktop-nightly-bin spotify
    echo ""
fi

echo_bold "Finished Installation"
