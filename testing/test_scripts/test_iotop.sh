###############################################################################

# This script tests the iotop tool

#Usage:
# $ sh test_iotop.sh

################################################################################
#!/bin/bash
    
#iotop
iotop --version
status=$?
if test $status -eq 0
then
   echo "Command iotop  -v [PASS]"
else
   echo "Command iotop -v [FAIL]"
   exit
fi

echo "iotop -b -n 3"
iotop -b -n 3
status=$?
if test $status -eq 0
then
   echo "Command iotop -b -n 3 [PASS]"
else
   echo "Command iotop -b -n 3 [FAIL]"
   exit
fi
exit



