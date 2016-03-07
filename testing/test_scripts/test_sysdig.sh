###############################################################################

# This script does basic tests for the sysdig tools

#Usage:
# $ sh test_sysdig.sh

################################################################################
#!/bin/bash
    
# Testing sysdig
sysdig --version
status=$?
if test $status -eq 0
then
    echo "command sysdig --version [PASS]"
else
    echo "command sysdig --version [PASS]"
    exit
fi

echo "sysdig Listing Linux events sysdig -n 40"
sysdig -n 40
status=$?
if test $status -eq 0
then
    echo "command sysdig -n 40 [PASS]"
else
    echo "command sysdig -n 40 [FAIL]"
    exit
fi
exit


