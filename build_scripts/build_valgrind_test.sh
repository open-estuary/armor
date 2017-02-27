###############################################################################

# This script builds Valgrind test code. 
#Usage:
# $ sh build_valgrind_test.sh 

################################################################################
#!/bin/bash

export ARCH=arm64

if [ -z "${1}" ] ; then
    unset CROSS_COMPILE
else 
    export CROSS_COMPILE=${1}
fi

if [ "$2" = '' ]; then
    echo "Invalid parameter passed. Usage sh build_valgrind_test.sh <distribution directory>" 
    exit
fi

echo "Building the valgrind's test code..."

cd ../source/test_code/valgrind_test_code/
make

# copy prebuilt binary on D02 to rootfs.
sudo cp valgrind_test  $2/test_scripts

cd -
echo "Building the valgrind's test code finished"



