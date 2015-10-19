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
   echo "Command operf -v passed"
else
   echo "Command operf -v failed"
   exit
fi

echo "operf"
operf   
status=$?
if test $status -eq 0
then
   echo "Command  operf passed"
else
   echo "Command operf failed"
   exit
fi

echo "opreport"
opreport
status=$?
if test $status -eq 0
then
   echo "Command opreport passed"
else
   echo "Command opreport failed"
   exit
fi

