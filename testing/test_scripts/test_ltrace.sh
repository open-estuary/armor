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

echo "ltrace ./file"
ltrace ./file
status=$?
if test $status -eq 0 
then 
   echo "Command ltrace ./file passed"
else   
   echo "Command ltrace ./file failed"
   exit
fi
exit


