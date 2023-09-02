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
vim \
alacritty \
mpv \
feh \
libreoffice-writer \
libreoffice-calc \
libreoffice-impress \
keepassxc \
gnome-tweak-tool \
gnome-shell-extension-background-logo \
gnome-shell-extension-common \
gnome-shell-extension-user-theme \
gnome-screenshot \
dconf-editor \
java-17-openjdk \
python3 \
rclone \
clang \
clang-tools-extra \
ripgrep \
tmux \
maven \
gdb \
okular \

# Install all of the required texlive packages
sudo dnf install -y \
texlive \
texlive-dvipng \
texlive-wrapfig \
texlive-ulem \
texlive-capt-of \
texinfo \

# Set up Snap and the snap packages
sudo dnf install -y snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install -y spotify

# Set up Flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.gnome.Extensions

# Set up Docker
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker

# Set up Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Symlink all the important files
mkdir ~/.config/git
mkdir ~/.config/alacritty
mkdir ~/.config/zathura
mkdir ~/.ctags.d
ln -sf ~/code/dotfiles/.config/git/ignore ~/.config/git/ignore
ln -sf ~/code/dotfiles/.config/alacritty ~/.config/alacritty/alacritty.yml
ln -sf ~/code/dotfiles/.config/zathura ~/.config/zathura/zathurarc
ln -sf ~/code/dotfiles/.ctags.d/default.ctags ~/.ctags.d/default.ctags
ln -sf ~/code/dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/code/dotfiles/bash/.bash_profile ~/.bash_profile
ln -sf ~/code/dotfiles/bash/.bash_aliases ~/.bash_aliases
ln -sf ~/code/dotfiles/.tmux.conf ~/.tmux.conf

# Create Rclone Directories
mkdir ~/onedrive_personal
mkdir ~/onedrive_wsu

# Move the systemd services
mkdir -p ~/.config/systemd/user
ln -s ~/code/dotfiles/systemd_services/rclone@.service ~/.config/systemd/user/rclone@.service
ln -s ~/code/dotfiles/systemd_services/emacs.service ~/.config/systemd/user/emacs.service
systemctl --user enable rclone@onedrive_personal.service
systemctl --user enable rclone@onedrive_wsu.service

# Install JetBrains Mono font
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# Clone down Emacs and Vim configs
git clone https://www.github.com/gregheiman/emacs-config.git ~/code/emacs-config
git clone https://www.githum.com/gregheiman/vim-config.git ~/code/vim-config

# Symlink all of the files from Emacs config
ln -s ~/code/emacs-config ~/.emacs.d

# Symlink all of the files from Vim config
ln - s ~/code/vim-config ~/.vim
ln -s ~/code/vim-config/nvim ~/.config/nvim

mkdir ~/programs

# Download the Tela icon theme from Github
git clone https://github.com/vinceliuice/Tela-icon-theme.git ~/programs/Tela-icon-theme
sh ~/programs/Tela-icon-theme/install.sh -d ~/.icons

# Download and build universal ctags
git clone https://github.com/universal-ctags/ctags.git ~/programs/universal-ctags
cd ~/programs/universal-ctags
./autogen.sh
./configure
make
sudo make install # may require extra privileges depending on where to install

# Download and build emacs
sudo dnf install -y jansson-devel mpfr-devel libmpc-devel gmp-devel libgccjit-devel \
    giflib-devel gnutls-devel libXpm-devel libjpeg-devel libpng-devel gtk3-devel libtiff-devel \
    dbus-devel ncurses-devel
git clone https://github.com/emacs-mirror/emacs ~/programs/emacs
cd ~/programs/emacs
./autogen.sh
./configure --with-dbus --with-gif --with-jpeg --with-png --with-rsvg \
    --with-tiff --with-gnutls --with-xft --with-xpm --with-gpm=no --with-modules --with-native-compilation \
    CFLAGS='-O2 -march=native' --program-transform-name=s/^ctags$/ctags_emacs/ --with-pgtk
make -j6
sudo make install

# Download and build neovim
sudo dnf install -y ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl
git clone https://github.com/neovim/neovim ~/programs/neovim
cd ~/programs/neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install

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
