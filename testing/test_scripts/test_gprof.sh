###############################################################################

# This script does basic tests for the gprof tool

#Usage:
# $ sh test_gprof.sh

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh gprof
status=$?
if test $status -eq 1
then
        exit
fi    

# Testing gprof
gprof --version
status=$?
if test $status -eq 0
then
    echo "command gprof --version [PASS]"
else
    echo "command gprof --version [FAIL]"
    exit
fi

rm gmon.out analysis.txt

echo "./gprof_test"
./gprof_test
status=$?
if test $status -eq 0
then
    echo "command ./gprof_test [PASS]"
else
    echo "command ./gprof_test [FAIL]"
    exit
fi

echo "gprof gprof_test gmon.out > analysis.txt"
gprof gprof_test gmon.out > analysis.txt
status=$?
if test $status -eq 0
then
    echo "command gprof gprof_test gmon.out > analysis.txt [PASS]"
else
    echo "command gprof gprof_test gmon.out > analysis.txt [FAIL]"
    exit
fi

echo "Please check analysis.txt for the gprof result"

exit
