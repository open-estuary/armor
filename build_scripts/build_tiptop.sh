###############################################################################

# This script download and build tool tiptop from the source code. 
#Example:
# $ sh build_tiptop.sh 

################################################################################
#!/bin/bash

#echo "Warning!. This build script work only on D02 Ubuntu platform"
echo "Building the Debug Tool tiptop ..."

#echo "Warning! building tiptop worked only on ARM64 RFS"
echo "Installing dependency components"


SOURCE_DIR="../source"
cd $SOURCE_DIR

apt-get install flex
apt-get install libfl-dev
apt-get install bison
apt-get install bison++
    
apt-get install help2man
apt-get install byacc
    
echo "building dependency component textinfo"
wget http://ftp.gnu.org/gnu/texinfo/texinfo-6.0.tar.gz
tar -xvzf texinfo-6.0.tar.gz
cd texinfo-6.0/
./configure  
make 
make install

cd -

echo "building tiptop..."
wget http://tiptop.gforge.inria.fr/releases/tiptop-2.3.tar.gz
tar -xvzf tiptop-2.3.tar.gz
cd tiptop-2.3/
./configure  
make
make install

cd -

cd -

echo "Building Debug Tool tiptop is completed"
