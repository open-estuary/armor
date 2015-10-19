###############################################################################

# This script tests the blktrace tool

#Usage:
# $ sh test_blktrace.sh

################################################################################
#!/bin/bash
    
#blktrace
blktrace -v
status=$?
if test $status -eq 0
then
   echo "Command blktrace  -v passed"
else
   echo "Command blktrace -v failed"
   exit
fi

echo "blktrace -d /dev/sda -w 3"
blktrace -d /dev/sda -w 3
status=$?
if test $status -eq 0
then
   echo "Command blktrace -d /dev/sda -w 3 passed"
else
   echo "Command blktrace -d /dev/sda -w 3 failed"
   exit
fi
exit

