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

################
# Interface
################
# load the last pyWal colorscheme that was in use
exec wal -R
# start up feh and set background
exec feh --bg-center $HOME/Ubuntu-Config/wallpapers/e67xCKM.png

################
# Utilities
################
# Authentication agent for polkit
exec mate-polkit
# Power manager
exec mate-power-manager
# Notification daemon
exec dunst
# Polybar, Compton, monitor script, and Rclone are in i3 config
