### to setup a computer in the lab just after installing arch:

sudo pacman -S base-devel

cd /tmp/
curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar zxvf package-query.tar.gz
cd package-query
makepkg -si
sudo pacman -U *.pkg.tar.xz  
cd ..
curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar zxvf yaourt.tar.gz
cd yaourt
makepkg -si
sudo pacman -U *.pkg.tar.xz
cd ..

#bootstrapping yaourt
yaourt -S yaourt

# very useful:
yaourt -S bash-completion

### Video capture
# what we need for the lab
yaourt -S opencv libdc1394-git mplayer ffmpeg gstreamer gstreamer0.10-plugins 
# it is important that coriender is installed AFTER libdc1394-git
yaourt -S coriander
# adding udev rule for our camera
sudo sh -c 'echo SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3006\", GROUP=\"plugdev\", SYMLINK+=\"firefly\", MODE:=\"0666\" > /etc/udev/rules.d/30-my.rules'


# we would like scientific packages:
yaourt -S imagej r octave python{2,}-scikit-learn  python{2,}-scipy imagemagick


# we would like scientific packages:
yaourt -S python-pip python2-pip

# system tools
yaourt -S htop tree


# setting up ssh server
sudo systemctl enable ssh.service 
sudo systemctl start ssh.service
