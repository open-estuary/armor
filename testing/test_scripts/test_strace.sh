###############################################################################

# This script tests the strace tool

#Usage:
# $ sh test_strace.sh 

################################################################################
#!/bin/bash
    
#strace
#Testing strace
strace -V
status=$?
if test $status -eq 0
then
    echo "command strace -V passed"
else
    echo "command strace -V failed"
    exit
fi

#System call usage summary
echo "strace -c ls /home"
strace -c ls /home    
status=$?
if test $status -eq 0
then
    echo "command strace -c ls /home passed"
else
echo "command strace -c ls /home failed"
    exit
fi
exit


