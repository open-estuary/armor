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

echo "ethtool eth3 - List ethernet device's properties"
ethtool eth3    
status=$?
if test $status -eq 0
then
    echo "command ethtool eth3 passed"
else
    echo "command ethtool eth3 failed"
    exit
fi

echo "ethtool -S eth3 - Display Network Statistics of Specific Ethernet Device"
ethtool -S eth3
status=$?
if test $status -eq 0
then
    echo "command ethtool -S eth3 passed"
else
    echo "command ethtool -S eth3 failed"
    exit
fi

echo "ethtool -i eth3 - Display Ethernet Driver Settings"
ethtool -i eth3
status=$?
if test $status -eq 0
then
    echo "command ethtool -i eth3 passed"
else
    echo "command ethtool -i eth3 failed"
    exit
fi
exit


