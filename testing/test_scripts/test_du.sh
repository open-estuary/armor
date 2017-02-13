###############################################################################

# This script tests the du tool

#Usage
# $ sh test_du.sh

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh du
status=$?
if test $status -eq 1
then
        exit
fi

#du
# Testing du
du --v
status=$?
if test $status -eq 0
then
    echo "command du --v  passed"
else
    echo "command du --v failed"
    exit
fi
    
echo "du -ah"
du -ah
status=$?
if test $status -eq 0
then
    echo "command du -ah  passed"
else
    echo "command du -ah failed"
    exit
fi
exit

