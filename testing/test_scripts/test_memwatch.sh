###############################################################################

# This script tests the memwatch tool

#Usage:
# $ sh test_memwatch.sh

################################################################################
#!/bin/bash
    
echo "Build & run test code for memwatch"

cd ../source/memwatch-2.69

#wget http://memwatch.sourceforge.net/memwatch-2.69.tar.gz
#tar -xvzf memwatch-2.69.tar.gz 

OLD_STR="\$(CC)"
NEW_STR="gcc"
sed -i -e "s/$OLD_STR/$NEW_STR/g" Makefile

OLD_STR="\#error \"Hey\! Don't just compile this program, read the comments first\!\""
NEW_STR=""
sed -i -e "s/$OLD_STR/$NEW_STR/g" test.c 

make 
./a.out
vi memwatch.log

cd -

echo "testing memwatch  tool finished"

exit


