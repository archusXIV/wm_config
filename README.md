# wm_config
## quickly configure i3, bspwm installed on pure Arch Linux base system via: [clone_wm](https://raw.githubusercontent.com/archusXIV/dotfiles/main/scripts/install_arch/clone_wm) script.

It is made to provide an already configured i3/bspwm 'desktop' just to get you started. Both configurations and associated tools will be installed, meaning if you choose to install i3, bspwm files will be present in ~/.config & ~/.local/bin so you can later on install bspwm package with pacman and vice versa.
Of course you will have to work a bit to make it yours completely.

The configuration files and scripts are examples so feel free to edit them to fit your needs.
## Provided tools
- bash zsh
- a bunch of scripts
- nano vim geany
- terminals (alacritty,urxvt,xterm)
- dmenu rofi
- a lot of Xresources themes (~/.config/xfiles/themes using theme_selector script)
- feh (as wallpaper setter)
- polybar, not customized but links to configs examples.
- mpd ncmpcpp pulsemixer
- gnome-keyring polkit-gnome pulseaudio (all running as systemd user services)
- sxhkd (also used with i3)

## installation
BE CAREFULL, don't launch clone_wm on a none fresh installed system!!!

First install the Arch base, then the window manager with these command lines.
```
curl -sL "https://raw.githubusercontent.com/archusXIV/dotfiles/main/scripts/install_arch/install_desktop" -O
chmod +x install_desktop && ./install_desktop
```
Once rebooted run the [clone_wm](https://raw.githubusercontent.com/archusXIV/dotfiles/main/scripts/install_arch/clone_wm) script that has been downloaded during the installation and placed in your $HOME directory. It is already executable.
```
./clone_wn
```
## First run
Geany will open this README.md when you first login so you can check your settings such as:

- .bashrc
- .bash_profile
- .xinitrc
- .zshenv
- .config/bash
- .config/bspwm/bspwmrc
- .config/i3/config (the official config is also in the same directory)
- .config/sxhkd/sxhkdrc (applications launchers, sound etc...)
- .config/sxhkd/sxhkdrc_i3
- .config/sxhkd/sxhkdrc_bspwm
- .config/zsh/
- .local/bin/autostart
## Dmenu scripts launcher
For user convenience when pressing mod4 + d a dmenu with subcategories will appear at the bottom of the screen. Where you can find an application menu, archwiki finder, autoscript editing function, a menu to open configs, a finder, keyboard shortcuts reminder, power menu, theme selector and a screenshooter.
## mpd configuration
Just modify its configuration in ~/.config/mpd/mpd.conf according to your likings (music path etc...).
Uncomment line 10 in ~/.config/systemd/user/Xsession.target then reload the systemd config:
```
systemctl --user deamon-reload && systemctl --user start mpd.service
```
Ncmpcpp is already here but please check its configuration file in ~/.config/ncmpcpp/config.
## Polybar configuration
Visit the polybar wiki, clone it or take a look at my [configs](https://github.com/archusXIV/dotfiles/tree/main/polybar), if you change the bar name please replace it in ~/.local/bin/launch_polybar & some other scripts.
```
cd ~/.config/polybar
git clone https://github.com/polybar/polybar.wiki.git
```
