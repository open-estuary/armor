###############################################################################

# This script build lldptool from the source code. 
#Usage:
# $ sh build_lldptool.sh 

################################################################################
#!/bin/bash

#echo "Warning!. This build script work only on D02 Ubuntu platform"
echo "Building the Debug Tool lldptool..."

#echo "building lldpad work only on Ubuntu arm64 RFS only"

echo "building lldpad..."
apt-get install libtool
apt-get install libconfig-dev
apt-get install libnl-3-dev
apt-get install readline-devel

SOURCE_DIR="../source"
cd $SOURCE_DIR
    
git clone git://open-lldp.org/open-lldp.git
#Working build solution on Ubuntu ARM64 RFS
cd open-lldp
./bootstrap.sh
./configure --build=aarch64-unknown-linux-gnu
make

cd -
cd -
 
echo "Building Debug Tool lldptool completed."
