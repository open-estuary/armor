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

echo "tiptop"
tiptop
status=$?
if test $status -eq 0 
then 
   echo "Command tiptop passed"
else   
   echo "Command tiptop failed"
   exit
fi
exit

