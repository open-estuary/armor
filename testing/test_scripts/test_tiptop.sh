###############################################################################

# This script tests the tiptop tool.

#Usage:
# $ sh test_tiptop.sh 

################################################################################
#!/bin/bash
    
#tiptop
tiptop --version
status=$?
if test $status -eq 0
then
   echo "Command tiptop  --version passed"
else
   echo "Command tiptop --version failed"
   exit
fi

echo "tiptop -d 2 -n 4"
tiptop -d 2 -n 4
status=$?
if test $status -eq 0 
then 
   echo "Command tiptop -d 2 -n 4 passed"
else   
   echo "Command tiptop -d 2 -n 4 failed"
   exit
fi
exit

