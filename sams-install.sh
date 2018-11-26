# Add the VSCode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Add the RPM fusion repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install packages
sudo dnf install code tmux htop vim cmake make the_silver_searcher tldr

# Install packages for dev
sudo dnf install boost-static ffmpeg ffmpeg-devel gtk2-devel gcc-c++ openssl-devel libcurl-devel

# Some more dev packages
sudo dnf install docker

# copy libcaffe2
sudo cp /usr/local/lib/libcaffe2.so /usr/lib64/

# Set tmux to use the tmux conf
ln -s -f ~/.tmux/.tmux.conf .
