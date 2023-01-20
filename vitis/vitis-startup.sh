export XILINX_VERSION=2022.2
export XILINX_PATH=/tools/Xilinx
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

