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

# what we need for the lab
yaourt -S opencv libdc1394-git coriander mplayer ffmpeg gstreamer gstreamer0.10-plugins 

# adding udev rule for our camera
sudo sh -c 'echo SUBSYSTEM=="usb", ATTRS{idVendor}=="1e10", ATTRS{idProduct}=="3006", GROUP="plugdev", SYMLINK+="firefly", MODE:="0666" > /etc/udev/rules.d/30-my.rules'



