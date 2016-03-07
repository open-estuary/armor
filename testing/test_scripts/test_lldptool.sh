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
   echo "Command lldptool -v [PASS]"
else
   echo "Command lldptool -v [FAIL]"
   exit
fi

echo "Configure LLDP adminStatus to Receive and Transmit for interface eth3"
lldptool set-lldp -i eth3 adminStatus=rxtx   
status=$?
if test $status -eq 0
then
   echo "Command  lldptool set-lldp -i eth3 adminStatus=rxtx  [PASS]"
else
   echo "Command lldptool set-lldp -i eth3 adminStatus=rxtx [FAIL]"
   exit
fi

echo "Query the local TLVs which are being transmitted for a given interface"
lldptool -t -i eth3
status=$?
if test $status -eq 0
then
   echo "Command lldptool -t -i eth3 [PASS]"
else
   echo "Command lldptool -t -i eth3 [FAIL]"
   exit
fi
exit


