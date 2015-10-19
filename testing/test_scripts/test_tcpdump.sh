###############################################################################

# This script tests the tcpdump tool

#Usage:
# $ sh test_tcpdump.sh

################################################################################
#!/bin/bash
    
#tcpdump - dump traffic on a network.   
tcpdump --version
status=$?
if test $status -eq 0
then
    echo "command tcpdump --version passed"
else
    echo "command tcpdump --version failed"
    exit
fi

echo "tcpdump -D - display the list of interfaces on which tcpdump can listen"
tcpdump -D
status=$?
if test $status -eq 0
then
    echo "command tcpdump -D passed"
else
    echo "command tcpdump -D failed"
    exit
fi

echo "tcpdump - dump traffic on any network for 5 packets"
tcpdump -i any -c 5
status=$?
if test $status -eq 0
then
    echo "command  tcpdump -i any -c 5 passed"
else
    echo "command  tcpdump -i any -c 5 failed"
    exit
fi
exit

