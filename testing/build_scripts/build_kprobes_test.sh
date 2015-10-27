###############################################################################

# This script build kprobes test code. 
#Example:
# $ sh build_kprobes_test.sh 

################################################################################
#!/bin/bash

echo "Building the Kprobes's test code..."

if [ "$1" == '' ]; then   
    echo "Invalid parameter passed. Usage sh build_kprobes.sh <kernal build directory>"
    exit
fi

export KPROBES_KERN_DIR=$1 
echo $KPROBES_KERN_DIR

cd ../source/kprobes_test/
make

echo "For testing copy binaries kprobe_test and kprobe_test.ko and script test_kprobes.sh to the rootfs"

echo "Building the Kprobes's test code finished"



