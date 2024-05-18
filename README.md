# Overview
Welcome to Hyprland-pokemon, a pokemon-based rice for Hyprland.  
I have always used other people's rices, fixing what possible or adapting what wasn't working, until a day I asked myself: "Why don't i write MY rice?", and so i did.  
This is still under working and in the future it will have 5+ themes to choose from. At the moment, only one is present (The Umbreon theme).  
P.S. I will not make a theme for every Eevolution, i'll just create a theme based on my favorite pokemons and considering one of each color (Example: Umbreon -> Yellow, Black, Rayquaza -> Green, ...)
# Dependecies
This is probably the most complicated part out of all.  
I'll try my best to include every dependency I'm using to make this config work
## Window Manager
The window manager used in this config is Hyprland.  
If you have any doubt you can check [the official documentation](https://www.hyprland.org): 
### Installation (For every dependency i'll cover the method for my system: Arch linux)
```
pacman -S hyprland #stable
yay -S hyprland-git #latest release
```
## Terminal emulator
I suggest using kitty because of its built-in image rendering system, you'll need it for the neofetch config.   
If you want to use a different terminal emulator, i'll cover how to modify the neofetch config later
### Installation
```
pacman -s kitty
```
## Neofetch
```
pacman -S neofetch
```
## Audio server
I'm using pipewire. If encounter any problem, i suggest looking at the official [Pipewire Documentation](https://wiki.archlinux.org/title/PipeWire) for Arch.
### Installation
```
pacman -S pipewire pipewire-alsa wireplumber pipewire-pulse
# Enable services
systemctl --user --now enable pipewire pipewire-pulse wireplumber
```
## Python dependencies
There are a couple of python scripts in this Hyprland config and you need to installer their dependencies so that they work properly
### Installation
```
pacman -S python-gobject
```
## Rofi
If you are using Hyprland, you are probably using Wayland as a compositor.  
The "standard" rofi is built for Xorg and i noticed that I was missing some keystrokes or even full commands when using it.  
I suggest installing this [specific fork.](https://github.com/lbonn/rofi)
## Browser
I'm using firefox and min-browser. You can of course use whatever you want.
## Installation
```
pacman -S firefox
yay -S min-browser-bin
```
## Code editor
I use Neovim as my main code editor and VSCode as my secondary.
### Installation
```
pacman -S neovim
yay -S visual-studio-code-bin
```
If you also want my Neovim config, you can clone my repo
```
git clone https://shdShadow/nvim-dotfiles ~/.config/nvim
```
