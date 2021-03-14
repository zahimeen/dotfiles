# init.vim

Zahin Muhaimeen's Neovim Configuration
This config was heavily inspired by 'ThePrimeagen' and 'ChrisAtMachine'.
Both of them are on YouTube

## Install Neovim > 0.5

- Ubuntu

  ```
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o /tmp/nvim.appimage

  sudo mv /tmp/nvim.appimage /usr/local/bin/nvim

  chmod +x /usr/local/bin/nvim
  ```

- Arch

```
yay -Syu neovim-nightly-bin
```
or 
```
yay -Syu neovim-nightly-git
```

## Install Node.js

- Ubuntu

```
# Using Ubuntu
curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodejs

# Using Debian, as root
curl -fsSL https://deb.nodesource.com/setup_15.x | bash -
apt-get install -y nodejs
```

- Arch

```
pacman -Syu nodejs npm
```


## Install Python and Node Support

- Python
 
```
pip install pynvim
```

- Node

```
npm i -g neovim
```

## Clone this repository

```
cd ~/.config/
git clone https://github.com/zahin-muhaimeen/nvim.git
```

## Install Plugins

First go into neovim
After that, type in the following commands

```
:PlugUpdate
:PlugUpgrade
:PlugInstall
```
