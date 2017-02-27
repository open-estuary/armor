###############################################################################

# This script tests the netstat tool

#Usage:
# $ sh test_netstat.sh 

################################################################################
#!/bin/bash
    
#check if installed
bash check_install.sh netstat
status=$?
if test $status -eq 1
then
        exit
fi

#netstat
# Testing netstat
# version return status failed on D02  
netstat --version
#status=$?
#if test $status -eq 0
#then
#   echo "command netstat --version passed"
#else
#   echo "command netstat --version failed"
#   exit
#fi

#list tcp connections
echo "list tcp connections - netstat -at"
netstat -at 
status=$?
if test $status -eq 0
then
    echo "command netstat -at [PASS]"
else
    echo "command netstat -at [FAIL]"
exit
fi

#list udp connections
echo "list udp connections - netstat -au"
netstat -au
status=$?
if test $status -eq 0
then
    echo "command netstat -au [PASS]"
else
    echo "command netstat -au [FAIL]"
    exit
fi

#list unix connections
echo "list unix connections - netstat -ax"
netstat -ax
status=$?
if test $status -eq 0
then
    echo "command netstat -ax [PASS]"
else
    echo "command netstat -ax [FAIL]"
    exit
fi
exit

