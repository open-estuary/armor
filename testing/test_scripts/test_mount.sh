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
    echo "command mount -V passed"
else
    echo "command mount -V failed"
    exit
fi
    
# view all mounts
mount
status=$?
if test $status -eq 0
then
    echo "command mount passed"
else
    echo "command mount failed"
    exit
fi
#mount -t iso9660 -o ro /dev/cdrom /mnt/
exit

