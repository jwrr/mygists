export XILINX_VERSION=2022.2
export XILINX_PATH=/tools/Xilinx

export XILINX_VIVADO="Error - not defined"
export XILINX_HLS="Error - not defined"
export XILINX_VITIS="Error - not defined"
export PETALINUX="Error - not defined"
export PETALINUX="Error - not defined"
echo source $XILINX_PATH/Vitis/$XILINX_VERSION/bin/setupEnv.sh
source $XILINX_PATH/Vitis/$XILINX_VERSION/bin/setupEnv.sh
echo source $XILINX_PATH/Vitis/$XILINX_VERSION/settings64.sh
source $XILINX_PATH/Vitis/$XILINX_VERSION/settings64.sh

## PetaLinux requires Bash shell.
## Use this to set shell to bash. Select 'NO' to switch to Bash.
echo skipping: sudo dpkg-reconfigure dash
# sudo dpkg-reconfigure dash

# if tftpd isn't running then start it
service tftpd-hpa status | grep inactive && sudo service tftpd-hpa start

# if user is not in group 'dialout' the add to group. This is needed to
# connect to USB.
groups | grep dialout || sudo adduser $USER dialout

echo source $XILINX_PATH/PetaLinux/$XILINX_VERSION/settings.sh
source $XILINX_PATH/PetaLinux/$XILINX_VERSION/settings.sh


env |grep XILINX_.*=
env |grep PETALINUX=

export PLATFORM_REPO_PATHS=~/vitis/platforms
env |grep PLATFORM_REPO_PATHS
echo done

