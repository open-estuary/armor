###############################################################################

# This script tests the oprofile tool

#Usage:
# $ sh test_oprofle.sh 

################################################################################
#!/bin/bash
    
#oprofile
operf -v
status=$?
if test $status -eq 0
then
   echo "Command operf -v [PASS]"
else
   echo "Command operf -v [FAIL]"
   exit
fi

echo "operf"
operf ./test_app   
status=$?
if test $status -eq 0
then
   echo "Command  operf [PASS]"
else
   echo "Command operf [FAIL]"
   exit
fi

echo "opreport"
opreport
status=$?
if test $status -eq 0
then
   echo "Command opreport [PASS]"
else
   echo "Command opreport [FAIL]"
   exit
fi

