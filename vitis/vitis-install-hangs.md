Vitis Install Hangs
===================

I tried to install vitis 2022.2 on Ubuntu 20.04 and the installer would just
stop. Annoying, it appears that the Vitis installer turns off logging and and
error reporting. You can see what Xilinx processes are still running:

```
ps aux |grep Xilinx
jwrr       44658  0.0  0.0   2632   540 pts/0    S+   22:09   0:00 /bin/sh -c /tools/Xilinx/Vivado/2022.2/bin/vivado -nolog -nojournal -mode batch -source /tools/Xilinx/Vivado/2022.2/scripts/sysgen/tcl/xlpartinfo.tcl -tclargs /tools/Xilinx/Vivado/2022.2/data/parts/installed_devices.txt
```

And then, without killing the install, you  run them from the terminal without
'-nolog -nojournal -mode batch'.

```
> /bin/sh -c /tools/Xilinx/Vivado/2022.2/bin/vivado -source /tools/Xilinx/Vivado/2022.2/scripts/sysgen/tcl/xlpartinfo.tcl -tclargs /tools/Xilinx/Vivado/2022.2/data/parts/installed_devices.txt
```

This should return an error message that hopefully helps figure out why the
install was hung. In my case I needed to install libncureses5 (I had
libncurses5-dev installed, but I guess that wasn't enough).

```
sudo apt install libncurses5
```

Then I restarted the Vitis installer, and six hours later it completed. SUCCESS!

Here are some of the packages that were installed, plus the missing libncurses5.
I'm not sure if all of these are needed.

```
sudo apt install build-essential iproute2 net-tools libncurses5-dev \
  zlib1g:i386 libssl-dev libselinux1 xterm libtool texinfo zlib1g-dev screen \
  pax gawk python3 python3-pexpect python3-pip python3-git python3-jinja2 \
  xz-utils debianutils iputils-ping libegl1-mesa libsdl1.2-dev pylint3 cpio \
  libncurses5
```

