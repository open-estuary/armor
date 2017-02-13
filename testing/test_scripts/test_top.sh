###############################################################################

# This script tests the top tools

#Usage:
# $ sh test_top.sh

################################################################################
#!/bin/bash

bash check_install.sh top
status=$?
if test $status -eq 1
then
        exit
fi
    
#top
# Testing top
top -v
status=$?
if test $status -eq 0
then
    echo "command top -V [PASS]"
else
    echo "command top -V [FAIL]"
    exit
fi

echo "Listing Linux tasks top -n 2"
top -n 2
status=$?
if test $status -eq 0
then
    echo "command top -n 2 [PASS]"
else
    echo "command top -n 2 [FAIL]"
    exit
fi
exit


