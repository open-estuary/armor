###############################################################################

# This script build tool nicstat from the source code. 
#Example:
# $ sh build_nicstat.sh

################################################################################
#!/bin/bash

#echo "Warning!. This build script work only on D02 Ubuntu platform"
echo "Building the Debug Tool nicstat..."

#echo "Warning! building nicstat worked only on ARM64 RFS"

SOURCE_DIR="../source"
cd $SOURCE_DIR

echo "building nicstat..."
git clone https://github.com/sysperf/nicstat.git
cd nicstat
./configure  
make
make install

cd -
cd -

echo "Building Debug Tool nicstat completed."
