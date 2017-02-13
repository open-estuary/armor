###############################################################################

# This script tests the awk tool

#Usage:
# $ sh test_awk.sh 

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh awk
status=$?
if test $status -eq 1
then
        exit
fi

    
#awk
awk -W version
status=$?
if test $status -eq 0
then
    echo "command awk -W version [PASS]"
else
    echo "command awk -W version [FAIL]"
exit
fi

echo "awk - data extraction and reporting tool"
awk '{print}' /proc/misc 
status=$?
if test $status -eq 0
then
    echo "command awk '{print}' /proc/misc [PASS]"
else
    echo "command awk '{print}' /proc/misc [FAIL]"
    exit
fi
exit

