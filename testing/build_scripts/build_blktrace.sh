###############################################################################

# This script build blktrace tool from source code. 
#Example:
# $ sh build_blktrace.sh 

################################################################################
#!/bin/bash

#echo "Warning!. This build script work only on D02 Ubuntu platform"
echo "Building the Debug Tool blktrace..."

echo "building blktrace..."
git clone git://git.kernel.dk/blktrace.git
git checkout 43fc870ce04e963def45dfc0d1ed4ea21ef10d4b
cd blktrace
./configure  
make
make install

echo "Building Debug Tool blktrace completed."
