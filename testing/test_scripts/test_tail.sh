###############################################################################

# This script tests the tail tool

#Usage:
# $ sh test_tail.sh 

################################################################################
#!/bin/bash
    
#tail
tail --version
status=$?
if test $status -eq 0
then
    echo "command tail --version [PASS]"
else
    echo "command tail --version [FAIL]"
    exit
fi

echo " tail -  tail prints the last 10 lines of each FILE to standard output"
tail /proc/misc
status=$?
if test $status -eq 0
then
    echo "command tail /proc/misc [PASS]"
else
    echo "command tail /proc/misc [FAIL]"
    exit
fi
exit


