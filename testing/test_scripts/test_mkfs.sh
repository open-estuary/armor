###############################################################################

# This script tests the mkfs tools
#Usage:
# $ sh test_mkfs.sh 

################################################################################
#!/bin/bash
    
#mkfs
# Testing mkfs
mkfs -V
status=$?
if test $status -eq 0
then
    echo "command mkfs -V passed"
else
    echo "command mkfs -V failed"
    exit
fi
exit

