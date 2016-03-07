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
    echo "command gdb -v [PASS]"
else
    echo "command gdb -v [FAIL]"
    exit
fi

# aarch64-linux-gnu-gcc gdb_test.c -Wall -o gdb_test
echo "gdb ./gdb_test"
gdb ./gdb_test
status=$?
if test $status -eq 0
then
    echo "command gdb ./gdb_test [PASS]"
else
    echo "command gdb ./gdb_test [FAIL]"
    exit
fi
exit

