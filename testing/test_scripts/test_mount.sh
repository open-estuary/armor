###############################################################################

# This script tests the mount tool

#Usage:
# $ sh test_mount.sh 

################################################################################
#!/bin/bash
    
#mount
# Testing mount
mount -V
status=$?
if test $status -eq 0
then
    echo "command mount -V [PASS]"
else
    echo "command mount -V [FAIL]"
    exit
fi
    
# view all mounts
mount
status=$?
if test $status -eq 0
then
    echo "command mount [PASS]"
else
    echo "command mount [FAIL]"
    exit
fi
#mount -t iso9660 -o ro /dev/cdrom /mnt/
exit

