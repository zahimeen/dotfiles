# Dotfiles
## ZSH

### Dependencies

Software that has the word `optional` in brackets next to it means that it is not required for the configuration to work, as I have `if` commands that initiate the normal one instead.

```
zsh             (required) (the shell itself)
zsh-completions (required) (provides better completion for software, 
                 and adds documentation information next to options)
exa             (optional) (better alternative to the 'ls' command)
ripgrep         (optional) (better alternative to the 'grep' command)
starship        (optional) (better prompt)
```

Other than the above software, you MUST use a nerd font because in the config, I use quite a few unicode characters.

### Deploy

Since my zsh configuration has multiple files and directories, I have placed it in a directory of its own. So I placed it in the `.config` directory of my home directory. Now for zsh to now where its `.zshrc` file is, you have to set the `ZDOTDIR`. I would recommend (if you are using xorg) to set the `ZDOTDIR` in your `.xprofile` file in your home directory.

## Bashrc

### Dependencies

The only program you need to have, is bash itself.

### Deploy

The only way I know of (other than a symbolic link) is to delete the '.bashrc' file in the home directory, or copy and paste the contents of my '.bashrc' into that file. If the file does not exist in your home directory, simply copy and paste this file, then run bash to see the results.

(I do not hold any responsibility if this does break your system or causes any unwanted errors or "features". Also keep in mind that this was only tested on Arch Linux, with not much care for testing.)

## XMonad

### Dependencies

```
xmonad			(required)
xmonad-contrib	(required)
```

The `Ubuntu` font is also required, but can be swapped out easily if you look at where it is. I am too lazy to put where it is in here.

### Deploy

Place the `.xmonad` directory in your home directory. Then just launch the tiling window manager. Do I really need to copy and paste all of the documentation here?

## Polybar

### Dependencies

The only dependencies required are polybar itself (since package managers will install the other stuff) and the `Iosevka Nerd Font`, which you can also find in the `AUR` as `nerd-fonts-iosevka`.

### Deploy

First, you have to place this configuration in your `.config` directory in your home directory. Then, you have to run the command `polybar main`. This will launch polybar, with the `main` bar.

## Kitty

### Dependencies

Kitty itself and (recommended) a mono spaced font that is also a nerd font.

### Deploy

Place the `kitty` directory in the `.config` directory in your home directory. Or just use `GNU Stow`. Learn it on the new Beta Brave Search Engine.

# TODO

- Add the README for the rest of my dotfiles
- Add links for the README
- Stop being lazy