###############################################################################

# This script tests the systemtap tool

#Usage
# $ sh test_systemtap.sh 

################################################################################
#!/bin/bash

bash check_install.sh stap
status=$?
if test $status -eq 1
then
        exit
fi
    
#systemtap
stap  --version
status=$?
if test $status -eq 0
then
   echo "Command stap --version [PASS]"
else
   echo "Command stap --version [FAIL]"
   exit
fi
echo "No further stap tests are supported"
exit
