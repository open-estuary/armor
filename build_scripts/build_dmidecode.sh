###############################################################################

# This script download and build dmidecode tool from the source code. 
#Example:
# $ sh build_armor_tool_int01.sh <CC - Cross Compiler>

################################################################################
#!/bin/bash
SOURCE_DIR="../source"

if [ "$1" = '' ] || [ "$2" = '' ]; then
    echo "Invalid parameter passed: sh build_dmidecode.sh <CC - cross compiler> <distribution directory>"
    exit
fi

echo "Building the Debug Tool dmidecode..."


cd $SOURCE_DIR
git clone git://git.savannah.nongnu.org/dmidecode.git
cd dmidecode
OLD_CC="CC      = gcc"
NEW_CC="CC      ="$1
sed -i -e "s/$OLD_CC/$NEW_CC/g" Makefile
make
#make install
#copy to the rootfs
sudo cp dmidecode $2/usr/bin
exit

echo "Building the dmidecode completed"

