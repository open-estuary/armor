###############################################################################

# This script tests the ethtool

#Example:
# $ sh test_ethtool.sh 

################################################################################
#!/bin/bash
    
#ethtool - query and control network driver and hardware settings.   
# Testing ethtool 
ethtool --version 
status=$?
if test $status -eq 0
then
    echo "command ethtool --version passed"
else
    echo "command ethtool --version failed"
    exit
fi

echo "ethtool eth0 - List ethernet device's properties"
ethtool eth0    
status=$?
if test $status -eq 0
then
    echo "command ethtool eth0 passed"
else
    echo "command ethtool eth0 failed"
    exit
fi

echo "ethtool -S eth0 - Display Network Statistics of Specific Ethernet Device"
ethtool -S eth0
status=$?
if test $status -eq 0
then
    echo "command ethtool -S eth0 passed"
else
    echo "command ethtool -S eth0 failed"
    exit
fi

echo "ethtool -i eth0 - Display Ethernet Driver Settings"
ethtool -i eth0
status=$?
if test $status -eq 0
then
    echo "command ethtool -i eth0 passed"
else
    echo "command ethtool -i eth0 failed"
    exit
fi
exit


