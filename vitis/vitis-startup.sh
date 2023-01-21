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

echo sudo service tftpd-hpa restart
sudo service tftpd-hpa restart
echo source $XILINX_PATH/PetaLinux/$XILINX_VERSION/settings.sh
source $XILINX_PATH/PetaLinux/$XILINX_VERSION/settings.sh

env |grep XILINX_.*=
env |grep PETALINUX=

echo done

