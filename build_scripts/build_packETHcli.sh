###############################################################################

# This script build packETHcli from the source code. 
#Usage:
# $ sh build_packETHcli.sh 

################################################################################
#!/bin/bash

echo "Building the Debug Tool packETHcli..."

if [ "$1" = '' ]; then
    echo "Invalid parameter passed. Usage sh build_packETHcli.sh <distribution directory>" 
    exit
fi

SOURCE_DIR="../source/packETH-1.8/cli/"
cd $SOURCE_DIR/
    
make
# copy prebuilt binary on D02 to rootfs.
sudo cp packETHcli $1/usr/bin

cd -
 
echo "Building Debug Tool packETHcli completed."
