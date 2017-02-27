###############################################################################

# This script tests the pidstat tool

#Usage:
# $ sh test_pidstat.sh

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh pidstat
status=$?
if test $status -eq 1
then
        exit
fi
    
#pidstat - report statistics for Linux tasks   
# Testing pidstat 
pidstat -V
status=$?
if test $status -eq 0
then
    echo "command pidstat -V [PASS]"
else
    echo "command pidstat -V [FAIL]"
    exit
fi

echo "Statistics for Linux tasks - "
pidstat -p ALL 3 2
status=$?
if test $status -eq 0
then
    echo "command pidstat -p ALL 3 2 [PASS]"
else
    echo "command pidstat -p ALL 3 2 [FAIL]"
    exit
fi
exit


