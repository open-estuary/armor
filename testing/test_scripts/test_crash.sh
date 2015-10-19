###############################################################################

# This script tests the crash tool.

#Usage:
# $ sh test_crash.sh 

################################################################################
#!/bin/bash
    
#crash
crash  -v
status=$?
if test $status -eq 0
then
   echo "Command crash -v passed"
else
   echo "Command crash -v failed"
   exit
fi
echo "No futher tests for crash tool are suppoted now"

