### to setup a computer in the lab just after installing arch:

yaourt -S  packer --noconfirm

packer -S bash-completion base-devel  --noconfirm

### Video capture
# what we need for the lab
packer -S opencv libdc1394-git mplayer ffmpeg gstreamer gstreamer0.10-plugins mencoder   --noconfirm 
# it is important that coriender is installed AFTER libdc1394-git
packer -S coriander  --noconfirm
# adding udev rule for our camera
sudo sh -c 'echo SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"1e10\", ATTRS{idProduct}==\"3006\", GROUP=\"plugdev\", SYMLINK+=\"firefly\", MODE:=\"0666\" > /etc/udev/rules.d/30-my.rules'


# we would like scientific packages:
packer -S imagej r octave python{2,}-scikit-learn python{2,}-numpy  python{2,}-scipy imagemagick   --noconfirm


# Python's pips
packer -S python-pip python2-pip ipython{2,}  --noconfirm 

# system tools
packer -S htop tree rsync   --noconfirm 


# setting up ssh server
sudo systemctl enable ssh.service 
sudo systemctl start ssh.service

# arduino

sudo gpasswd -a $USER uucp
sudo gpasswd -a $USER lock
sudo gpasswd -a $USER tty

packer -S arduide-git --noconfirm
