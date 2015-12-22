###############################################################################

# This script builds Valgrind test code. 
#Usage:
# $ sh build_valgrind_test.sh 

################################################################################
#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

if [ "$1" = '' ]; then
    echo "Invalid parameter passed. Usage sh build_valgrind_test.sh <distribution directory>" 
    exit
fi

echo "Building the valgrind's test code..."

cd ../source/test_code/valgrind_test_code/
make

# copy prebuilt binary on D02 to rootfs.
sudo cp valgrind_test  $1/usr/local/armor/test_scripts

cd -
echo "Building the valgrind's test code finished"



