PetaLinux - Create New Project
==============================

```
export BOARD_NAME=zybo_z7_20
export VITIS_VERSION=2022_2
export PROJECT_NAME=${BOARD_NAME}_base_$VITIS_VERSION

mkdir -p ~/vitis/workspace/$BOARD_NAME/hardware
cd ~/vitis/workspace/$BOARD_NAME/hardware
vivado &



mkdir -p ~/vitis/workspace/$BOARD_NAME/software/linux_files
cd ~/vitis/workspace/$BOARD_NAME/software/linux_files
mkdir boot image
cd ~/vitis/workspace/$BOARD_NAME/software
petalinux-create -t project --template zynq -n ${PROJECT_NAME}-petalinux

petalinux-config --get-hw-description=../../hardware/${PROJECT_NAME}-vivado/
## misc/config System Configuration window
   ## No changes. Just exit.

petalinux-config -c kernel
## Linux/arm Kernel Configuration menu
   ## Library Routines -> Size in Mega Bytes: Increase from 16 to 1024

led ./project-spec/meta-user/recipes-bsp/devide-tree/fukes/system-user.dtsi
led ./project-spec/meta-user/conf/user-rootfsconfig

petalinux-config -c rootfs
## user packages menu
   ## Select all packages
   
petalinux-build

sudo gparted
## New size(MIB): 3950, fat32, BOOT

```


