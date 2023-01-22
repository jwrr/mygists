sudo apt update
sudo apt upgrade -y
sudo apt install build-essential gcc-multilib iproute2 net-tools libncurses5-dev \
  zlib1g:i386 libssl-dev libselinux1 xterm libtool texinfo zlib1g-dev screen pax \
  gawk python3 python3-pexpect python3-pip python3-git python3-jinja2 xz-utils \
  debianutils iputils-ping libegl1-mesa libsdl1.2-dev pylint3 cpio libncurses5 \
  curl git cmake tftpd-hpa libxv-dev
mkdir -p git/mine
mkdir -p git/others
cd ~/git/mine
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/gists
cd gists
ln -s $PWD/my_bash_aliases ~/.bash_aliases
cd
source .bash_aliases
cd ~/git/mine
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/lued
cd lued
source COMPILE
mkdir ~/bin
ln -s $PWD ~/.lued
ln -s $PWD/lued ~/bin/lued
export PATH=$PATH:~/bin
# lued README.md
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
alias vitis_start='source ~/git/mine/gists/vitis/vitis-startup.sh'
vitis_start
cd ~/git/mine
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/moocs
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/fpga-stuff
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/micro-stuff
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/micro-stuff
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/cpp-stuff
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/jetson-stuff
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/python-stuff
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/lua-stuff
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/lcurses
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/redbean-lua-examples
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/kicad-stuff
git clone https://jwrr:BIG_NUMBER_AUTH_KEY@github.com/jwrr/z80usbstuff

sudo apt install libcanberra-gtk-module arduino
arduino &
sudo snap install --classic code
code README.md &

# Install Platform IO for VS Code:
# https://platformio.org/install/ide?install=vscode

### Download latest from conda
# https://docs.conda.io/en/latest/miniconda.html



cd
cp -rf .bashrc .bashrc.SAVE
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
diff -s .bashrc .bashrc.SAVE
mv .bashrc .bashrc.CONDA
mv .bashrc.SAVE .bashrc
alias conda_start='source ~/.bashrc.CONDA'
conda_start

## Bump to latest
conda -V
conda update conda
conda update --all
conda -V
