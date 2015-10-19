###############################################################################

# This script tests the lldptool tool

#Usage:
# $ sh test_lldptool.sh

################################################################################
#!/bin/bash
    
#lldptool
lldptool -v
status=$?
if test $status -eq 0
then
   echo "Command lldptool -v passed"
else
   echo "Command lldptool -v failed"
   exit
fi

echo "Configure LLDP adminStatus to Receive and Transmit for interface eth3"
lldptool set-lldp -i eth3 adminStatus=rxtx   
status=$?
if test $status -eq 0
then
   echo "Command  lldptool set-lldp -i eth3 adminStatus=rxtx  passed"
else
   echo "Command lldptool set-lldp -i eth3 adminStatus=rxtx failed"
   exit
fi

echo "Query the local TLVs which are being transmitted for a given interface"
lldptool -t -i eth3
status=$?
if test $status -eq 0
then
   echo "Command lldptool -t -i eth3 passed"
else
   echo "Command lldptool -t -i eth3 failed"
   exit
fi
exit


