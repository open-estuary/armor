###############################################################################

# This script tests the gdb tool

#Usage:
# $ sh test_gdb.sh 

################################################################################
#!/bin/bash
    
#gdb
#Testing gdb
gdb -v
status=$? 
if test $status -eq 0
then
    echo "command gdb -v passed"
else
    echo "command gdb -v failed"
    exit
fi

# aarch64-linux-gnu-gcc gdb_test.c -Wall -o gdb_test
echo "gdb ./gdb_test"
gdb ./gdb_test
status=$?
if test $status -eq 0
then
    echo "command gdb ./gdb_test passed"
else
    echo "command gdb ./gdb_test failed"
    exit
fi
exit

