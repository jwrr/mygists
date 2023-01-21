

Update & Upgrade Ubuntu 20.04 Packages
--------------------------------------

```
sudo apt update
sudo apt upgrade -y
```

Install Base Packages
---------------------

```
sudo apt install build-essential gcc-multilib iproute2 net-tools libncurses5-dev \
  zlib1g:i386 libssl-dev libselinux1 xterm libtool texinfo zlib1g-dev screen pax \
  gawk python3 python3-pexpect python3-pip python3-git python3-jinja2 xz-utils \
  debianutils iputils-ping libegl1-mesa libsdl1.2-dev pylint3 cpio libncurses5 \
  git cmake tftpd-hpa
```


Install .bash_aliases from Github
---------------------------------

```
mkdir -p git/mine
mkdir -p git/others
cd ~/git/mine
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/gists
cd gists
ln -s $PWD/my_bash_aliases ~/.bash_aliases 
source .bash_aliases 
```


Install Lued
------------

```
cd ~/git/mine
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/lued
cd lued
source COMPILE 
mkdir ~/bin
ln -s $PWD ~/.lued
ln -s $PWD/lued ~/bin/lued
export PATH=$PATH:~/bin
lued README.md 
```


Install Xilinx Vitis, Vivado and PetaLinux
------------------------------------------

Download 2022.2 installers from Xilinx website

```
cd ~/Downloads
chmod 755 Xilinx_Unified_2022.2_1014_8888_Lin64.bin 
sudo mkdir -p /tools/Xilinx
sudo chown jwrr /tools/Xilinx
sudo chgrp jwrr /tools/Xilinx

# Run the Vitis installer (Vivado also gets installed)
./Xilinx_Unified_2022.2_1014_8888_Lin64.bin 

# Run the PetaLinux installer
./petalinux-v2022.2-10141622-installer.run -d /tools/Xilinx/PetaLinux/2022.2

# Run the Vitis initialization script from my github account
vitis_start  # source ~/git/mine/gists/vitis/vitis-startup.sh
```


Install More Github Repos
--------------------

```
cd ~/git/mine
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/moocs
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/fpga-stuff
```


Install VS Code
---------------

```
sudo snap install --classic code
code README.md
```


Install Arduino
---------------

```
sudo apt install arduino libcanberra-gtk-module
arduino
```




