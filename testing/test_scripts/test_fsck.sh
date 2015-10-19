###############################################################################

# This script tests the fsck tool

#Usage:
# $ sh test_fsck.sh 

################################################################################
#!/bin/bash
    
#fsck   
echo " - display the status of a partition with a problem if any in the stdout without fixing it."
fsck -n /dev/sda7 
status=$?
if test $status -eq 0
then
    echo "command fsck -n /dev/sda7 passed"
else
    echo "command fsck -n /dev/sda7 failed"
    exit
fi
exit


