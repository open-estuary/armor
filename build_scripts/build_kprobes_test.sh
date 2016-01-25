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
echo $KPROBES_KERN_DIR

cd ../source/test_code/kprobes_test_code/

make

cd -
echo "For testing copy binaries kprobe_test and kprobe_test.ko and script test_kprobes.sh to the rootfs"

echo "Building the Kprobes's test code finished"



