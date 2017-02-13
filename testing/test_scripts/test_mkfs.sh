###############################################################################

# This script tests the mkfs tools
#Usage:
# $ sh test_mkfs.sh 

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh mkfs
status=$?
if test $status -eq 1
then
        exit
fi
    
#mkfs
# Testing mkfs
mkfs -V
status=$?
if test $status -eq 0
then
    echo "command mkfs -V [PASS]"
else
    echo "command mkfs -V [FAIL]"
    exit
fi
exit

