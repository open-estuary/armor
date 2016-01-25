###############################################################################

# This script build ktap kernel module and ktap user space code and sample code
#Example:
# $ sh build_ktap.sh 

################################################################################
#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

kernel_version=$(sudo cat $1/include/config/kernel.release)
#echo "kernel_version=$kernel_version"

if [ "$1" = '' ] || [ "$2" = '' ]; then
    echo "Invalid parameter passed. Usage sh build_ktap.sh <kernal build directory> <distribution directory>" 
    exit
fi

echo "Building the ktap source code..."
cd ../source/ktap/
OLD_STR="KERNEL_SRC ?= \/lib\/modules\/\$(KVERSION)\/build"
NEW_STR="KERNEL_SRC ?="$1
sed -i "s@$OLD_STR@$NEW_STR@" Makefile

make

# copy prebuilt binary on D02 to rootfs.
sudo cp ktap  $2/usr/bin
sudo cp ktapvm.ko $2/lib/modules/$kernel_version/armor
sudo cp samples/helloworld.kp  $2/usr/local/armor/test_scripts 
cd -


