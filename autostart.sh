#!/bin/bash
# Autostart script to download nessacary pacakges and set up basic configurations

# Make sure user is using the right distro
echo -e "What Linux distro are you using?"
read DISTRO

if [[ $DISTRO == "Ubuntu" || $DISTRO == "ubuntu" || $DISTRO == "UBUNTU" ]]; then
    set INSTALL = "sudo apt-get install"
    echo "Distro:" $DISTRO "is valid. Proceeding with configuration..."
else
    echo "Script does not work for your chosen distro:" $DISTRO
    exit 1
fi

# Check to make sure git exists

# Install I3 Gaps

# Install needed packages through apt

# Install needed packages through snap

# Created needed symlinks

# Download and install Vim configuration

# Run Pywal commands to set wallpaper and colorscheme

# Uninstall unneeded packages (Gnome stuff, GDM)

# Restart system after confirmation
