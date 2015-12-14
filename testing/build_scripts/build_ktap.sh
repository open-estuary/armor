###############################################################################

# This script build ktap kernel module and ktap user space code and sample code
#Example:
# $ sh build_ktap.sh 

################################################################################
#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

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
sudo cp ktap  $2/usr/local/armor/test_scripts 
sudo cp ktapvm.ko  $2/usr/local/armor/test_scripts 
sudo cp samples/helloworld.kp  $2/usr/local/armor/test_scripts 
cd -


