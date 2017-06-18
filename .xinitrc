#!/bin/sh

# Load german keyboard layout.
setxkbmap de
setxkbmap -option caps:escape

# Make touchpad less sensitive.
syndaemon -i 0.5 -d -k -t

# Start i3.
exec i3
