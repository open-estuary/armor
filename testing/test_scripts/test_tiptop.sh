###############################################################################

# This script tests the tiptop tool.

#Usage:
# $ sh test_tiptop.sh 

################################################################################
#!/bin/bash

bash check_install.sh tiptop
status=$?
if test $status -eq 1
then
        exit
fi
   
#tiptop
tiptop --version
status=$?
if test $status -eq 0
then
   echo "Command tiptop  --version [PASS]"
else
   echo "Command tiptop --version [FAIL]"
   exit
fi

echo "tiptop -d 2 -n 4"
tiptop -d 2 -n 4
status=$?
if test $status -eq 0 
then 
   echo "Command tiptop -d 2 -n 4 [PASS]"
else   
   echo "Command tiptop -d 2 -n 4 [FAIL]"
   exit
fi
exit

