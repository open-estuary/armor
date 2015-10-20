###############################################################################

# This script tests the ltrace tool

#Usage:
# $ sh test_ltrace.sh 

################################################################################
#!/bin/bash
    
# Testing ltrace
# aarch64-linux-gnu-gcc file.c -Wall -o file
ltrace --v
status=$?
if test $status -eq 0
then
   echo "Command ltrace --v passed"
else
   echo "Command ltrace --v failed"
   exit
fi

echo "ltrace ./test_app"
ltrace ./test_app
status=$?
if test $status -eq 0 
then 
   echo "Command ltrace ./test_app passed"
else   
   echo "Command ltrace ./test_app failed"
   exit
fi
exit


