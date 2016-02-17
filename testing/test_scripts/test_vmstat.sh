###############################################################################

# This script tests the vmstat tool

#Example:
# $ sh test_vmstat.sh 

################################################################################
#!/bin/bash
    
#vmstat
vmstat -V
status=$?
if test $status -eq 0
then
    echo "command vmstat -V passed"
else
    echo "command vmstat -V failed"
    exit
fi

echo "vmstat 1 5"
vmstat 1 5
status=$?
if test $status -eq 0
then
    echo "command vmstat 1 5 passed"
else
    echo "command vmstat 1 5 failed"
exit
fi

