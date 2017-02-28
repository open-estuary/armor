###############################################################################

# This script tests the crash tool.

#Usage:
# $ sh test_crash.sh 

################################################################################
#!/bin/bash
    
#check if installed
bash check_install.sh crash
status=$?
if test $status -eq 1
then
	exit
fi

#crash
crash  -v
status=$?
if test $status -eq 0
then
   echo "Command crash -v [PASS]"
else
   echo "Command crash -v [FAIL]"
   exit
fi
echo "No futher tests for crash tool are suppoted now"

