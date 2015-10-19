###############################################################################

# This script tests the nicstat

#Usage:
# $ sh test_nicstat.sh

################################################################################
#!/bin/bash
    
#nicstat
nicstat -v   
status=$?
if test $status -eq 0
then
   echo "Command nicstat -v passed"
else
   echo "Command nicstat -v failed"
   exit
fi

echo "nicstat 1 5"
nicstat 1 5
status=$?
if test $status -eq 0
then
   echo "Command nicstat 1 5 passed"
else
   echo "Command nicstat 1 5 failed"
   exit
fi


