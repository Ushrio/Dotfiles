#!/bin/bash 
# Autostart script to download necessary packages and set up basic configurations

# Make sure user is using a supported distribution
echo -e "What Linux distribution are you using?"
read DISTRO

# Planned support for Ubuntu/Debian, Void, Fedora, and Arch
if [[ $DISTRO == "Ubuntu" || $DISTRO == "ubuntu" || $DISTRO == "UBUNTU" ]]; then
    set UBUNTU == "true"
    set INSTALL = "sudo apt-get =y install"
    echo "Distribution:" $DISTRO "is valid. Proceeding with configuration..."
elif [[ $DISTRO == "Void" || $DISTRO == "void" || $DISTRO == "VOID" ]]; then
    set VOID = "true"
    set INSTALL = "xbps-install -S"
    echo "Distribution:" $DISTRO "is valid. Proceeding with configuration..."
else
    echo "Script does not work for your chosen distribution:" $DISTRO
    exit 1
fi

# Check to make sure git exists

# Install Windows Manager
echo "Installing window manager"
if [[ $VOID == "true" ]]; then
    exec $INSTALL " i3-gaps"
elif [[ $FEDORA == "true" ]]; then
    exec $INSTALL " sway"
fi

# Install needed packages through package manager

# Install needed packages through snap

# Created needed symlinks
# Symlink entire .config folder to home
echo "Symlinking .config folder"
ln -s ../.config ~/.config

# Symlink bashrc
echo "Symlinking .bashrc"
ln -s ../bash/.bashrc ~/.bashrc

# Symlink feh script
echo "Symlinking .fehbg"
ln -s ../feh/.fehbg ~/.fehbg

# Symlink .xinitrc
echo "Symlinking display server configuration"
if [[ $FEDORA == "true" ]]; then
    echo "Not copying .xinitrc because system defaults to Wayland"
else 
    ln -s ../xinitrc/.xinitrc ~/.xinitrc
fi

# Download and install Vim configuration
echo -e "Would you like to set up Vim configuration? (Y,N) "
read DOWNLOAD_VIM_CHOICE

if [[ $DOWNLOAD_VIM_CHOICE == "Y" || $DOWNLOAD_VIM_CHOICE == "y" || $DOWNLOAD_VIM_CHOICE == "yes" || $DOWNLOAD_VIM_CHOICE == "YES"]]; then
    git clone https://github.com/Ushrio/Vim-Config.git
    echo -e "Would you like to set up Vim or Nvim (Selecting Nvim will set up both) (V,N) "
    read VIM_CHOICE

    if [[ $VIM_CHOICE == "V" || $VIM_CHOICE == "v" ]]; then
        ln -s ~/Vim-Config/.vimrc ~/.vim/.vimrc
        ln -s ~/Vim-Config/after ~/.vim/after
    elif [[ $VIM_CHOICE == "N" || $VIM_CHOICE == "n" ]]
        ln -s ~/Vim-Config/.vimrc ~/.vim/.vimrc
        ln -s ~/Vim-Config/after ~/.vim/after
        ln -s ~/Vim-Config/nvim/init.vim ~/.config/nvim/init.vim
    fi
else
    echo "Will not set up Vim"
    continue
fi

# Run Pywal commands to set wallpaper and colorscheme

# Uninstall unneeded packages (Gnome stuff, GDM)

# Restart system after confirmation
