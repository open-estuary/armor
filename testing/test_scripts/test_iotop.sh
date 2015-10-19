###############################################################################

# This script tests the iotop tool

#Usage:
# $ sh test_iotop.sh

################################################################################
#!/bin/bash
    
#iotop
iotop -v
status=$?
if test $status -eq 0
then
   echo "Command iotop  -v passed"
else
   echo "Command iotop -v failed"
   exit
fi

echo "iotop -b -n 3"
iotop
status=$?
if test $status -eq 0
then
   echo "Command iotop -b -n 3 passed"
else
   echo "Command iotop -b -n 3 failed"
   exit
fi
exit



