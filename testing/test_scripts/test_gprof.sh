###############################################################################

# This script does basic tests for the gprof tool

#Usage:
# $ sh test_gprof.sh

################################################################################
#!/bin/bash
    
# Testing gprof
gprof --version
status=$?
if test $status -eq 0
then
    echo "command gprof --version passed"
else
    echo "command gprof --version failed"
    exit
fi

rm gmon.out analysis.txt

echo "./gprof_test"
./gprof_test
status=$?
if test $status -eq 0
then
    echo "command ./gprof_test  passed"
else
    echo "command ./gprof_test failed"
    exit
fi

echo "gprof gprof_test gmon.out > analysis.txt"
gprof gprof_test gmon.out > analysis.txt
status=$?
if test $status -eq 0
then
    echo "command gprof gprof_test gmon.out > analysis.txt  passed"
else
    echo "command gprof gprof_test gmon.out > analysis.txt failed"
    exit
fi

echo "Please check analysis.txt for the gprof result"

exit
