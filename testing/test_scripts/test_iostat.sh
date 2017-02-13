###############################################################################

# This script tests the iostat tool

#Usage:
# $ sh test_iostat.sh

################################################################################
#!/bin/bash
    
#check if installed
bash check_install.sh iostat
status=$?
if test $status -eq 1
then
        exit
fi

#iostat - report statistics for the CPU, I/O for devices, partitions and NFS.   
# Testing iostat 
iostat -V
status=$?
if test $status -eq 0
then
    echo "command iostat -V [PASS]"
else
    echo "command iostat -V [FAIL]"
    exit
fi

echo "iostat - report statistics for  CPU, I/O for devices etc"
iostat 
status=$?
if test $status -eq 0
then
    echo "command iostat [PASS]"
else
    echo "command iostat [FAIL]"
exit
fi

echo "Display disk I/O statistics"
iostat -d 2 6
status=$?
if test $status -eq 0
then
    echo "command iostat -d 2 6 [PASS]"
else
    echo "command iostat -d 2 6 [FAIL]"
    exit
fi
exit
     
 
