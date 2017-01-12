###############################################################################

# This script build kprobes test code. 
#Example:
# $ sh build_kprobes_test.sh 

################################################################################
#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

echo "Building the Kprobes's test code..."

if [ "$1" = '' ]; then   
    echo "Invalid parameter passed. Usage sh build_kprobes.sh <kernal build directory>"
    exit
fi

export KPROBES_KERN_DIR=$1 
echo "$KPROBES_KERN_DIR"

cd ../source/test_code/kprobes_test_code/

make

# copy prebuilt binary on to the rootfs.
sudo cp kprobe_test  $2/usr/local/armor/test_scripts
sudo cp kprobe_test.ko $2/usr/local/armor/test_scripts

cd -

echo "Building the Kprobes's test code finished"



