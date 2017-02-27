###############################################################################

# This script tests the vmstat tool

#Example:
# $ sh test_vmstat.sh 

################################################################################
#!/bin/bash

bash check_install.sh vmstat
status=$?
if test $status -eq 1
then
        exit
fi
    
#vmstat
vmstat -V
status=$?
if test $status -eq 0
then
    echo "command vmstat -V [PASS]"
else
    echo "command vmstat -V [FAIL]"
    exit
fi

echo "vmstat 1 5"
vmstat 1 5
status=$?
if test $status -eq 0
then
    echo "command vmstat 1 5 [PASS]"
else
    echo "command vmstat 1 5 [FAIL]"
exit
fi

