###############################################################################

# This script build the armor utility source code and sample code.

################################################################################
#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

if [ "$1" = '' ]; then
    echo "Invalid parameter passed. Usage sh build_armor_utility.sh <distribution directory>" 
    exit
fi

echo "Building the armor_utility source code..."
cd ../source/armor_utility/

make clean
make

# copy binaries and config files to the rootfs.
sudo cp bin/armor_utility  $1/usr/bin
cd -


