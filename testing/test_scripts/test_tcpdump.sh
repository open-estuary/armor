###############################################################################

# This script tests the tcpdump tool

#Usage:
# $ sh test_tcpdump.sh

################################################################################
#!/bin/bash

bash check_install.sh tcpdump
status=$?
if test $status -eq 1
then
        exit
fi
    
#tcpdump - dump traffic on a network.   
tcpdump --version
status=$?
if test $status -eq 0
then
    echo "command tcpdump --version [PASS]"
else
    echo "command tcpdump --version [FAIL]"
    exit
fi

echo "tcpdump -D - display the list of interfaces on which tcpdump can listen"
tcpdump -D
status=$?
if test $status -eq 0
then
    echo "command tcpdump -D [PASS]"
else
    echo "command tcpdump -D [FAIL]"
    exit
fi

echo "tcpdump - dump traffic on any network for 5 packets"
tcpdump -i any -c 5
status=$?
if test $status -eq 0
then
    echo "command  tcpdump -i any -c 5 [PASS]"
else
    echo "command  tcpdump -i any -c 5 [FAIL]"
    exit
fi
exit

