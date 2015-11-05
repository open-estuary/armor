###############################################################################

# This script build lttng kernel module and lttng user space test code. 
#Example:
# $ sh build_lttng_test.sh 

################################################################################
#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

if [ "$1" = '' ] || [ "$2" = '' ]; then
    echo "Invalid parameter passed. Usage sh build_lttng.sh <kernal build directory> <distribution directory>" 
    exit
fi

echo "Building the lttng's kernel module..."
cd ../source/lttng-modules-2.6.4/
make KERNELDIR=$1 
#install lttng modules to the rootfs. modify and run lttng_modules_install.sh
echo "To install lttng modules to the rootfs, please modify and run lttng_modules_install.sh"
sh lttng_modules_install.sh $1 $2  
cd -

echo "Building the lttng userspace test code ..."
cd ../source/test_code/lttng_ust_test_code/
#make  
# copy prebuilt binary on D02 to rootfs.
sudo cp lttng_ust_test  $2/usr/local/armor/test_scripts 
cd -

echo "For testing please copy binary lttng_ust_test and test scripts test_lttng_kernel.sh and test_lttng_ust.sh to the rootfs"

echo "Building the Kprobes's test code finished"

