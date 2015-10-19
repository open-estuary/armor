###############################################################################

# This script tests the swapon, swapoff tools 

#Example:
# $ sh test_swapon.sh 

################################################################################
#!/bin/bash
    
#swapon, swapoff
# Testing swapon and swapoff
swapon -V
status=$?
if test $status -eq 0
then
    echo "command swapon -V passed"
else
    echo "command swapon -V failed"
    exit
fi

swapoff -V
status=$?
if test $status -eq 0
then
    echo "command swapoff -V passed"
else
    echo "command swapoff -V failed"
    exit
fi

echo "swapon -s..."
swapon -s
status=$?
if test $status -eq 0
then
    echo "command swapon -s passed"
else
    echo "command swapon -s failed"
    exit
fi

echo "swapoff -a..."
swapoff -a
status=$?
if test $status -eq 0
then
    echo "command swapoff -a passed"
else
    echo "command swapoff -a failed"
exit
fi

echo "swapon -s..."
swapon -s

echo "swapon -a..."
swapon -a

echo "swapon -s..."
swapon -s


