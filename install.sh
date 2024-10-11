#! /usr/bin/bash
exec stow i3
exec stow nvim
exec stow personal
exec stow tmux
exec stow xterm
exec stow bash

exec sudo mkdir /etc/keyd/
exec sudo touch /etc/keyd/default.conf
exec sudo echo "
[ids]
*

[main]
capslock = layer(symbols)
alt = layer(alt)

[symbols]
f = (
j = )
d = {
k = }
s = [
l = ]
h = !
g = ^

[alt]
a = 1
s = 2
d = 3
f = 4
g = 5
h = 6
j = 7
k = 8
l = 9
; = 0
" > /etc/keyd/default.conf

exec sudo pacman -Syy
exec sudo pacman -S tmux neovim keyd firefox obsidian xterm
