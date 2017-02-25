###############################################################################

# This script builds gprof test code. 
#Usage:
# $ sh build_gprof_test.sh 

################################################################################
#!/bin/bash

export ARCH=arm64

if [ -z "${1}" ] ; then
    unset CROSS_COMPILE
else 
    export CROSS_COMPILE=${1}
fi

if [ "$2" = '' ]; then
    echo "Invalid parameter passed. Usage sh build_gprof_test.sh <distribution directory>" 
    exit
fi

echo "Building the gprof's test code..."

cd ../source/test_code/gprof_test_code/
make

# copy prebuilt binary on D02 to rootfs.
sudo cp gprof_test  $2/usr/local/armor/test_scripts

cd -
echo "Building the Kprobes's test code finished"



