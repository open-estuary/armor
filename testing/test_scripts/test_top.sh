###############################################################################

# This script tests the top tools

#Usage:
# $ sh test_top.sh

################################################################################
#!/bin/bash
    
#top
# Testing top
top -v
status=$?
if test $status -eq 0
then
    echo "command top -V passed"
else
    echo "command top -V failed"
    exit
fi

echo "Listing Linux tasks top -n 2"
top -n 2
status=$?
if test $status -eq 0
then
    echo "command top -n 2 passed"
else
    echo "command top -n 2 failed"
    exit
fi
exit


