#!/bin/sh

# Load german keyboard layout.
setxkbmap us -option caps:escape
xset r rate 200 30

# Make touchpad less sensitive.
syndaemon -i 0.5 -d -k -t

# Start i3.
exec i3
