###############################################################################

# This script tests the sar tool

#Usage:
# $ sh test_sar.sh 

################################################################################
#!/bin/bash

#sar
sar -V
status=$?
if test $status -eq 0 
then
   echo "Command sar -V passed"
else
   echo "Command sar -V failed"
   exit
fi

#  Testing sar
#switch on the sysstat and enable system log collection 
OLD_STR="false"
NEW_STR="true"
sed -i -e "s/$OLD_STR/$NEW_STR/g" /etc/default/sysstat
service sysstat restart 
#Displays CPU usage for the current day that was collected until that point.
echo "sar -u" 
sar -u
status=$?
if test $status -eq 0 
then 
   echo "Command sar -u passed"
else   
   echo "Command sar -u failed"
   exit
fi
 
# same as “sar -u” but displays additional fields
echo "sar -u ALL" 
sar -u ALL 
status=$?
if test $status -eq 0 
then 
   echo "Command sar -u ALL passed"
else
   echo "Command sar -u ALL failed"
   exit
fi
exit


