###############################################################################

# This script tests the fsck tool

#Usage:
# $ sh test_fsck.sh 

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh fsck
status=$?
if test $status -eq 1
then
        exit
fi
    
#fsck   
echo " - display the status of a partition with a problem if any in the stdout without fixing it."
fsck -n /dev/sda7 
status=$?
if test $status -eq 0
then
    echo "command fsck -n /dev/sda7 [PASS]"
else
    echo "command fsck -n /dev/sda7 [FAIL]"
    exit
fi
exit


