#!/bin/sh

# Load german keyboard layout
setxkbmap de

# Start composition manager
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

# Disable caps-lock
xmodmap ~/.xmodmap-`uname -n`

# Load fonts from .fonts
xset fp+ $HOME/.fonts/misc
xset fp+ $HOME/.fonts/ohsnap
xset fp+ $HOME/.fonts/terminesspowerline
xset fp+ $HOME/.fonts/tewi

#WIFI (optional)
#nm-applet &
#wicd-gtk -t &

# Make touchpad less sensitive
syndaemon -i 0.5 -d -k -t

# Start i3
exec i3
