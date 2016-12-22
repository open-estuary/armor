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
cd ../source/
git clone https://github.com/lttng/lttng-modules
cd -
cp lttng_modules_install.sh ../source/lttng-modules/
cd ../source/lttng-modules/

make KERNELDIR=$1 
#install lttng modules to the rootfs. modify and run lttng_modules_install.sh
sh lttng_modules_install.sh $1 $2  
cd -

echo "Building the lttng userspace test code ..."
cd ../source/test_code/lttng_ust_test_code/
#make  
# copy prebuilt binary on D02 to rootfs.
sudo cp lttng_ust_test  $2/usr/local/armor/test_scripts 
cd -


