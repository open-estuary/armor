###############################################################################

# This script tests the awk tool

#Usage:
# $ sh test_awk.sh 

################################################################################
#!/bin/bash
    
#awk
awk -W version
status=$?
if test $status -eq 0
then
    echo "command awk -W version passed"
else
    echo "command awk -W version failed"
exit
fi

echo "awk - data extraction and reporting tool"
awk '{print}' /proc/misc 
status=$?
if test $status -eq 0
then
    echo "command awk '{print}' /proc/misc passed"
else
    echo "command awk '{print}' /proc/misc failed"
    exit
fi
exit

