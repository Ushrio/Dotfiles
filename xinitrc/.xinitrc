#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

##################
# Window Mangers/Desktop Environments
##################
# start i3
startx /usr/bin/i3
