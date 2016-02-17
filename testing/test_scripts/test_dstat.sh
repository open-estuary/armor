###############################################################################

# This script tests the dstat tool

#Usage:
# $ sh test_dstat.sh 

################################################################################
#!/bin/bash
    
#dstat
dstat -v
status=$?
if test $status -eq 0
then
   echo "Command dstat  -v passed"
else
   echo "Command dstat -v failed"
   exit
fi

echo "dstat -all 1 4"
dstat -all 1 4
status=$?
if test $status -eq 0
then
   echo "Command dstat -all 1 4 passed"
else
   echo "Command dstat -all 1 4 failed"
   exit
fi
exit

