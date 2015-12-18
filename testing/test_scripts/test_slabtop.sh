###############################################################################

# This script does basic tests for the slabtop tool

#Usage:
# $ sh test_slabtop.sh

################################################################################
#!/bin/bash
    
# Testing slabtop
slabtop --version
status=$?
if test $status -eq 0
then
    echo "command slabtop --version passed"
else
    echo "command slabtop --version failed"
    exit
fi

echo "testing slabtop..."
slabtop -o
status=$?
if test $status -eq 0
then
    echo "command slabtop -o passed"
else
    echo "command slabtop -o failed"
    exit
fi
exit


