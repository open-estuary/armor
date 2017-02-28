###############################################################################

# This script tests the dstat tool

#Usage:
# $ sh test_dstat.sh 

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh dstat
status=$?
if test $status -eq 1
then
        exit
fi    

#dstat
dstat -v
status=$?
if test $status -eq 0
then
   echo "Command dstat  -v [PASS]"
else
   echo "Command dstat -v [FAIL]"
   exit
fi

echo "dstat -all 1 4"
dstat -all 1 4
status=$?
if test $status -eq 0
then
   echo "Command dstat -all 1 4 [PASS]"
else
   echo "Command dstat -all 1 4 [FAIL]"
   exit
fi
exit

