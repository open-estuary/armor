###############################################################################

# This script download and build tools from the source code. 
#Example:
# $ sh build_armor_tool_int01.sh <tool's name>

################################################################################
#!/bin/bash

if [ "$1" = '' ]; then
    echo "Usage: sh build_armor_tool_int01.sh <tool's name>"
    exit
fi

if [ "$1" = '-h' ]; then
    echo "Usage: sh build_armor_tool_int01.sh <tool's name>"
    echo "Supported Tools List:"
    echo "dmidecode"
    exit
fi

echo "Building the Debug Tool $1..."

if [ "$1" = 'dmidecode' ]; then
    git clone https://github.com/mirror/dmidecode
    cd dmidecode
    make
    make install
    exit
fi

echo "Building Debug Tool $1 is not supported."
