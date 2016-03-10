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
    echo "command ethtool --version [PASS]"
else
    echo "command ethtool --version [FAIL]"
    exit
fi

nw_if=$(ip route  | awk '{ print $5; exit }')
echo "nw_if = $nw_if"
echo "ethtool $nw_if - List ethernet device's properties"
ethtool $nw_if    
status=$?
if test $status -eq 0
then
    echo "command ethtool $nw_if [PASS]"
else
    echo "command ethtool $nw_if [FAIL]"
    exit
fi

echo "ethtool -S $nw_if - Display Network Statistics of Specific Ethernet Device"
ethtool -S $nw_if
status=$?
if test $status -eq 0
then
    echo "command ethtool -S $nw_if [PASS]"
else
    echo "command ethtool -S $nw_if [FAIL]"
    exit
fi

echo "ethtool -i $nw_if - Display Ethernet Driver Settings"
ethtool -i $nw_if
status=$?
if test $status -eq 0
then
    echo "command ethtool -i $nw_if [PASS]"
else
    echo "command ethtool -i $nw_if [FAIL]"
    exit
fi

echo "ethtool -t $nw_if  online - Test Ethernet adapter"
ethtool -t $nw_if online
status=$?
if test $status -eq 0
then
    echo "command ethtool -t $nw_if online [PASS]"
else
    echo "command ethtool -t $nw_if online [FAIL]"
    exit
fi

echo "ethtool -g $nw_if - queries the ethernet device's for rx/tx ring parameter information"
ethtool -g $nw_if
status=$?
if test $status -eq 0
then
    echo "command ethtool -g $nw_if [PASS]"
else
    echo "command ethtool -g $nw_if [FAIL]"
    exit
fi

echo "ethtool -d $nw_if - queries the ethernet device's for associated driver information"
ethtool -d $nw_if
status=$?
if test $status -eq 0
then
    echo "command ethtool -d $nw_if [PASS]"
else
    echo "command ethtool -d $nw_if [FAIL]"
    exit
fi

echo "ethtool -e $nw_if - retrieves and prints an EEPROM dump for the specified ethernet device"
ethtool -d $nw_if
status=$?
if test $status -eq 0
then
    echo "command ethtool -e $nw_if [PASS]"
else
    echo "command ethtool -e $nw_if [FAIL]"
    exit
fi

echo "ethtool -P $nw_if - blinking one or more LEDs on the specific ethernet port."
ethtool -P $nw_if
status=$?
if test $status -eq 0
then
    echo "command ethtool -P $nw_if [PASS]"
else
    echo "command ethtool -P $nw_if [FAIL]"
    exit
fi

echo "ethtool -r $nw_if - restarts auto-negotiation on the specified ethernet device, if auto-negotiation is enabled"
ethtool -r $nw_if
status=$?
if test $status -eq 0
then
    echo "command ethtool -r $nw_if [PASS]"
else
    echo "command ethtool -r $nw_if [FAIL]"
    exit
fi

exit
