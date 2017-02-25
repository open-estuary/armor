###############################################################################

# This script build the armor utility source code and sample code.

################################################################################
#!/bin/bash

export ARCH=arm64

if [ -z "${1}" ]; then
    unset CROSS_COMPILE
else
    export CROSS_COMPILE=${1}
fi

if [ "$2" = '' ]; then
    echo "Invalid parameter passed. Usage sh build_armor_utility.sh <distribution directory>" 
    exit
fi

echo "Building the armor_utility source code..."
cd ../source/armor_utility/

make clean
make

# copy binaries and config files to the rootfs.
sudo cp bin/armor_utility  $2/usr/bin
cd -


