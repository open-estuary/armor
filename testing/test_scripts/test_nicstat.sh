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
   echo "Command nicstat -v [PASS]"
else
   echo "Command nicstat -v [FAIL]"
   exit
fi

echo "nicstat 1 5"
nicstat 1 5
status=$?
if test $status -eq 0
then
   echo "Command nicstat 1 5 [PASS]"
else
   echo "Command nicstat 1 5 [FAIL]"
   exit
fi


