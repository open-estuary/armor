###############################################################################

# This script build memwatch tool from the source code. 
#Example:
# $ sh build_memwatch.sh

################################################################################
#!/bin/bash

echo "Building the Debug Tool memwatch..."

echo "building memwatch..."

SOURCE_DIR="../source"
cd $SOURCE_DIR


wget http://memwatch.sourceforge.net/memwatch-2.69.tar.gz
tar -xvzf memwatch-2.69.tar.gz 
cd memwatch-2.69
make 
#    ./a.out
#    vi memwatch.log

cd -
cd -

echo "Building Debug Tool memwatch is completed."
