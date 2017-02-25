###############################################################################

# This script build kprobes test code. 
#Example:
# $ sh build_kprobes_test.sh 

################################################################################
#!/bin/bash

export ARCH=arm64

if [ -z "${1}" ] ; then
    unset CROSS_COMPILE
else
    export CROSS_COMPILE=${1}
fi

echo "Building the Kprobes's test code..."

if [ "$2" = '' ]; then   
    echo "Invalid parameter passed. Usage sh build_kprobes.sh <kernal build directory>"
    exit
fi

export KPROBES_KERN_DIR=$2
echo "$KPROBES_KERN_DIR"

cd ../source/test_code/kprobes_test_code/

make

# copy prebuilt binary on to the rootfs.
sudo cp kprobe_test  $3/usr/local/armor/test_scripts
sudo cp kprobe_test.ko $3/usr/local/armor/test_scripts

cd -

echo "Building the Kprobes's test code finished"



