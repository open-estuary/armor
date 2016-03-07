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
    echo "command swapon -V [PASS]"
else
    echo "command swapon -V [FAIL]"
    exit
fi

swapoff -V
status=$?
if test $status -eq 0
then
    echo "command swapoff -V [PASS]"
else
    echo "command swapoff -V [FAIL]"
    exit
fi

echo "swapon -s..."
swapon -s
status=$?
if test $status -eq 0
then
    echo "command swapon -s [PASS]"
else
    echo "command swapon -s [FAIL]"
    exit
fi

echo "swapoff -a..."
swapoff -a
status=$?
if test $status -eq 0
then
    echo "command swapoff -a [PASS]"
else
    echo "command swapoff -a [FAIL]"
exit
fi

echo "swapon -s..."
swapon -s

echo "swapon -a..."
swapon -a

echo "swapon -s..."
swapon -s


