###############################################################################

# This script tests the iostat tool

#Usage:
# $ sh test_iostat.sh

################################################################################
#!/bin/bash
    
#iostat - report statistics for the CPU, I/O for devices, partitions and NFS.   
# Testing iostat 
iostat -V
status=$?
if test $status -eq 0
then
    echo "command iostat -V passed"
else
    echo "command iostat -V failed"
    exit
fi

echo "iostat - report statistics for  CPU, I/O for devices etc"
iostat 
status=$?
if test $status -eq 0
then
    echo "command iostat passed"
else
    echo "command iostat failed"
exit
fi

echo "Display disk I/O statistics"
iostat -d
status=$?
if test $status -eq 0
then
    echo "command iostat -d passed"
else
    echo "command iostat -d failed"
    exit
fi
exit
    

