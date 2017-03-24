#!/bin/sh

# Load german keyboard layout.
setxkbmap de
setxkbmap -option caps:escape

# Load compton.
compton -b

# Load fonts from .fonts.
xset fp+ $HOME/.fonts/misc
xset fp+ $HOME/.fonts/terminesspowerline

# Make touchpad less sensitive.
syndaemon -i 0.5 -d -k -t

# Start i3.
exec i3
