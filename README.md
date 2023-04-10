# wm_config, Arch Linux + i3/bspwm made easy.
## quickly configure i3, bspwm installed on pure Arch Linux base system via: [clone_wm](https://raw.githubusercontent.com/archusXIV/dotfiles/main/scripts/various/clone_wm) script.

It is made to provide an already configured i3/bspwm 'desktop' just to get you started.
Of course you will have to work a bit to make it yours completely.

The configuration files and scripts are examples so feel free to edit them to fit your needs.
## Provided tools
- bash zsh
- a bunch of scripts
- vim geany
- terminals (alacritty,urxvt,xterm)
- dmenu rofi
- a lot of Xresources themes
- feh (as wallpaper setter)
- polybar, not customized but links to configs examples.
- mpd ncmpcpp pulsemixer
- gnome-keyring polkit-gnome pulseaudio (all running as systemd user services)

## installation
First install the Arch base, then the window manager with these commandlines.
```
curl -sL "https://raw.githubusercontent.com/archusXIV/dotfiles/main/scripts/various/install_desktop" -O
chmod +x install_desktop && ./install_desktop
```
Once rebooted run the [clone_wm](https://raw.githubusercontent.com/archusXIV/dotfiles/main/scripts/various/clone_wm) script that has been downloaded during the installation and placed in your $HOME directory. It is already executable.
```
./clone_wn
```
## First run
Geany will open this README.md when you first login so you can check your settings such as:
```
~/.local/bin/autostart
~/.config/i3/config (the official config is also in the same directory)
~/.config/bspwm/bspwmrc
~/.config/sxhkd/sxhkdrc
```
As I said polybar isn't configured (customized) so I you want to, open a terminal and type:
```
mkdir ~/.config/polybar
cp /usr/share/doc/polybar/examples/config.ini ~/.config/polybar
```
Then start editing config.ini or visit the polybar wiki, clone it or take a look at my [configs](https://github.com/archusXIV/dotfiles/tree/main/polybar)
```
git clone https://github.com/polybar/polybar.wiki.git
```
