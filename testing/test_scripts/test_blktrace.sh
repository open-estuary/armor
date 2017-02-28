###############################################################################

# This script tests the blktrace tool

#Usage:
# $ sh test_blktrace.sh

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh blktrace
status=$?
if test $status -eq 1
then
        exit
fi
    
#blktrace
blktrace -v
status=$?
if test $status -eq 0
then
   echo "Command blktrace  -v [PASS]"
else
   echo "Command blktrace -v [FAIL]"
   exit
fi

echo "blktrace -d /dev/sda -w 3"
blktrace -d /dev/sda -w 3
status=$?
if test $status -eq 0
then
   echo "Command blktrace -d /dev/sda -w 3 [PASS]"
else
   echo "Command blktrace -d /dev/sda -w 3 [FAIL]"
   exit
fi
exit

