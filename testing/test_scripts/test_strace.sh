###############################################################################

# This script tests the strace tool

#Usage:
# $ sh test_strace.sh 

################################################################################
#!/bin/bash

bash check_install.sh strace
status=$?
if test $status -eq 1
then
        exit
fi
    
#strace
#Testing strace
strace -V
status=$?
if test $status -eq 0
then
    echo "command strace -V [PASS]"
else
    echo "command strace -V [FAIL]"
    exit
fi

#System call usage summary
echo "strace -c ls /home"
strace -c ls /home    
status=$?
if test $status -eq 0
then
    echo "command strace -c ls /home [PASS]"
else
echo "command strace -c ls /home [FAIL]"
    exit
fi
exit


