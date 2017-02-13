###############################################################################

# This script tests the perf tool

#Usage:
# $ sh test_perf.sh 

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh perf
status=$?
if test $status -eq 1
then
        exit
fi

perf list | grep -i "hardware cache event"
status=$?
if test $status -eq 0
then
    echo "command perf list [PASS]"
else
    echo "command perf list [FAIL]"
    exit -1
fi

perf stat -e r24f300 ls -l >/dev/null
status=$?
if test $status -eq 0
then
    echo "command perf stat for LLC event [PASS]"
else
    echo "command perf stat for LLC event [FAIL]"
    exit -1
fi

exit 0
