###############################################################################

# This script tests the pidstat tool

#Usage:
# $ sh test_pidstat.sh

################################################################################
#!/bin/bash
    
#pidstat - report statistics for Linux tasks   
# Testing pidstat 
pidstat -V
status=$?
if test $status -eq 0
then
    echo "command pidstat -V passed"
else
    echo "command pidstat -V failed"
    exit
fi

echo "Statistics for Linux tasks - "
pidstat -p ALL 3 2
status=$?
if test $status -eq 0
then
    echo "command pidstat -p ALL 3 2 passed"
else
    echo "command pidstat -p ALL 3 2 failed"
    exit
fi
exit


