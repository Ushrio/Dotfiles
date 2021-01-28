#!/bin/bash
# Autostart script to download nessacary pacakges and set up basic configurations

# Make sure user is using the right distro
echo -e "What Linux distro are you using?"
read DISTRO

# Planned support for Ubuntu, Void, Debian, and Arch
if [[ $DISTRO == "Ubuntu" || $DISTRO == "ubuntu" || $DISTRO == "UBUNTU" ]]; then
    set UBUNTU == "true"
    set INSTALL = "sudo apt-get install"
    echo "Distro:" $DISTRO "is valid. Proceeding with configuration..."
elif [[ $DISTRO == "Void" || $DISTRO == "void" || $DISTRO == "VOID" ]]; then
    set VOID = "true"
    set INSTALL = "xbps-install -S"
    echo "Distro:" $DISTRO "is valid. Proceeding with configuration..."
else
    echo "Script does not work for your chosen distro:" $DISTRO
    exit 1
fi


# Check to make sure git exists

# Install I3 Gaps
if [[ $VOID == "true" ]]; then
    exec $INSTALL " i3-gaps"
fi

# Install needed packages through package manager

# Install needed packages through snap

# Created needed symlinks
# Symlink entire .config folder to home
ln -s ../.config ~/.config
# Symlink wallpapers
ln -s ../Wallpapers ~/Pictures/Wallpapers
# Symlink bashrc
ln -s ../bash/.bashrc ~/.bashrc
# Symlink feh script
ln -s ../feh/.fehbg ~/.fehbg
# Symlink .xinitrc
ln -s ../xinitrc/.xinitrc ~/.xinitrc

# Download and install Vim configuration

# Run Pywal commands to set wallpaper and colorscheme

# Uninstall unneeded packages (Gnome stuff, GDM)

# Restart system after confirmation
