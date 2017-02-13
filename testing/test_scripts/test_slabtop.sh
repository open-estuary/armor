###############################################################################

# This script does basic tests for the slabtop tool

#Usage:
# $ sh test_slabtop.sh

################################################################################
#!/bin/bash

bash check_install.sh slabtop
status=$?
if test $status -eq 1
then
        exit
fi
  
# Testing slabtop
slabtop --version
status=$?
if test $status -eq 0
then
    echo "command slabtop --version [PASS]"
else
    echo "command slabtop --version [FAIL]"
    exit
fi

echo "testing slabtop..."
slabtop -o
status=$?
if test $status -eq 0
then
    echo "command slabtop -o [PASS]"
else
    echo "command slabtop -o [FAIL]"
    exit
fi
exit


