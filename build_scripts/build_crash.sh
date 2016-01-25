###############################################################################

# This script build crash tool from the source code. 
#Example:
# $ sh build_crash.sh 

################################################################################
#!/bin/bash

echo "Building the Debug Tool crash..."

SOURCE_DIR="../source"

#echo "building crash work only on arm64 RFS only"
echo "building crash..."

cd $SOURCE_DIR

git clone  https://github.com/crash-utility/crash
#Working build solution on ARM64 RFS
cd crash 
make

cd -
cd -

echo "Building Debug Tool crash is completed."
