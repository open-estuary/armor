###############################################################################

# This script download and build tools from the source code. 
#Example:
# $ sh build_armor_tool_int01.sh <tool's name>

################################################################################
#!/bin/bash
SOURCE_DIR="../source"

if [ "$1" = '' ] ||  [ "$2" = '' ]; then
    echo "Usage: sh build_armor_tool_int01.sh <tool's name> <CC - cross compiler>"
    exit
fi

if [ "$1" = '-h' ]; then
    echo "Usage: sh build_armor_tool_int01.sh <tool's name> <CC - cross compiler>"
    echo "Supported Tools List:"
    echo "dmidecode"
    exit
fi

echo "Building the Debug Tool $1..."

if [ "$1" = 'dmidecode' ]; then
    cd $SOURCE_DIR
    git clone https://github.com/mirror/dmidecode
    cd dmidecode
    OLD_CC="CC      = gcc"
    NEW_CC="CC      ="$2
    sed -i -e "s/$OLD_CC/$NEW_CC/g" Makefile
    make
    #make install
    exit
fi

echo "Building Debug Tool $1 is not supported."

