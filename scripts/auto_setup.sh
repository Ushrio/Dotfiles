#!/bin/bash

# Remove all of the unneeded and unwanted programs
sudo dnf group remove -y gnome-desktop
sudo dnf remove -y rhythmbox ctags

# Upgrade all of the package
sudo dnf upgrade -y

# Setup the rpm fusion repos
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install all of the required programs
sudo dnf install -y\ 
vim\ 
neovim\ 
alacritty\ 
mpv\
feh\
cmus\
zathura\ 
zathura-pdf-poppler\ 
libreoffice-writer\ 
libreoffice-calc\
libreoffice-impress\
libreoffice-draw\
keepassxc\
gnome-tweak-tool\
gnome-extensions-app\
gnome-shell-extnesion-background-logo\
gnome-shell-extnesion-common\
gnome-shell-extnesion-user-theme\
gnome-screenshot\
dconf-editor\
java-11-openjdk\
python3\
rclone\
clang\
clang-tools-extra\
ripgrep\
tmux\
maven\
gdb\

# Install all of the required texlive packages
sudo dnf install -y \
texlive \
texlive-dvipng \
texlive-wrapfig \
texlive-ulem \
texlive-capt-of \

# Set up Snap and the snap packages
sudo dnf install -y snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install -y spotify

# Symlink all the important files
mkdir ~/.config/git
mkdir ~/.config/alacritty
mkdir ~/.config/zathura
mkdir ~/.ctags.d
ln -s ~/Dotfiles/.config/git/ignore ~/.config/git/ignore
ln -s ~/Dotfiles/.config/alacritty ~/.config/alacritty/alacritty.yml 
ln -s ~/Dotfiles/.config/zathura ~/.config/zathura/zathurarc 
ln -s ~/Dotfiles/.ctags.d/default.ctags ~/.ctags.d/default.ctags 
ln -s ~/Dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/Dotfiles/.tmux.conf ~/.tmux.conf

# Move the systemd services
mkdir -p ~/.config/systemd/user
ln -s ~/Dotfiles/systemd_services/rclone.service ~/.config/systemd/user/rclone.service
ln -s ~/Dotfiles/systemd_services/onedrivewsu.service ~/.config/systemd/onedrivewsu.service
ln -s ~/Dotfiles/systemd_services/emacs.service ~/.config/systemd/emacs.service
systemctl --user enable rclone.service
systemctl --user enable onedrivewsu.service
systemctl --user enable emacs.service 

# Create Rclone Directories
mkdir ~/OneDrive\ -\ Personal
mkdir ~/OneDrive\ -\ WSU

# Install Iosevka font
sudo dnf copr enable -y peterwu/iosevka
sudo dnf install -y iosevka-fonts

# Clone down Emacs and Vim configs
git clone https://www.github.com/Ushrio/Emacs-Config.git
git clone https://www.githum.com/Ushrio/Vim-Config.git

# Symlink all of the files from Emacs config
ln -s ~/Emacs-Config/init.el ~/.emacs.d/init.el
ln -s ~/Emacs-Config/early-init.el ~/.emacs.d/early-init.el
ln -s ~/Emacs-Config/Custom ~/.emacs.d/Custom
ln -s ~/Emacs-Config/mu4e ~/.emacs.d/mu4e

# Symlink all of the files from Vim config
ln -s ~/Vim-Config/.vimrc ~/.vim/.vimrc
ln -s ~/Vim-Config/after ~/.vim/after
ln -s ~/Vim-Config/autoload ~/.vim/autoload
ln -s ~/Vim-Config/nvim ~/.config/nvim

# Download the Tela icon theme from Github
git clone https://github.com/vinceliuice/Tela-icon-theme.git
sh ~/Tela-icon-theme/install.sh -d ~/.icons
rm -d -r ~/Tela-icon-theme

mkdir ~/Programs
# Download and build universal ctags
git clone https://github.com/universal-ctags/ctags.git ~/Programs/
cd ~/Programs/ctags
./autogen.sh
./configure
make
sudo make install # may require extra privileges depending on where to install

# Download and build emacs
sudo dnf install -y jansson-devel mpfr-devel libmpc-devel gmp-devel libgccjit-devel \
    libungif-compat-devel libXpm-devel libjpeg-devel libpng-devel gtk3-devel libtiff-devel \
    dbus-devel ncurses-devel
git clone https://github.com/flatwhatson/emacs ~/Programs/
cd ~/Programs/emacs
./autogen.sh
./configure -C --with-dbus --with-gif --with-jpeg --with-png --with-rsvg \
    --with-tiff --with-gnutls --with-xft --with-xpm --with-gpm=no --with-modules --with-native-compilation \
    --with-pgtk CFLAGS='-O2 -march=native' --program-transform-name=s/^ctags$/ctags_emacs/
make -j6
sudo make install
systemctl -user start emacs

# Install python packages
pip install --user pynvim

# Setup new root password
sudo passwd

# Echo a message with the final steps that need to be completed
echo "The final steps are the following:"
echo "Set up SSH keys for Github"
echo "Set up Rclone OneDrive directories"
echo "Login to Firefox and websites"
echo "Set up KeePassXC for passwords"
