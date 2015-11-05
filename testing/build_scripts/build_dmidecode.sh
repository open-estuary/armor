###############################################################################

# This script download and build dmidecode tool from the source code. 
#Example:
# $ sh build_armor_tool_int01.sh <CC - Cross Compiler>

################################################################################
#!/bin/bash
SOURCE_DIR="../source"

if  [ "$1" = '' ] then
    echo "Usage: sh build_armor_tool_int01.sh <CC - cross compiler>"
    exit
fi

echo "Building the Debug Tool dmidecode..."

cd $SOURCE_DIR
git clone https://github.com/mirror/dmidecode
cd dmidecode
OLD_CC="CC      = gcc"
NEW_CC="CC      ="$2
sed -i -e "s/$OLD_CC/$NEW_CC/g" Makefile
make
#make install
exit

echo "Building the dmidecode completed"

