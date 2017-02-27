###############################################################################

# This script tests the dmidecode tool

#Usage:
# $ sh test_dmidecode.sh 

################################################################################
#!/bin/bash
    
#check if installed
bash check_install.sh dmidecode
status=$?
if test $status -eq 1
then
        exit
fi


#dmidecode
/usr/bin/dmidecode -V
status=$?
if test $status -eq 0
then
    echo "command /usr/bin/dmidecode -V [PASS]"
else
    echo "command /usr/bin/dmidecode -V [FAIL]"
    exit
fi

echo "dmidecode command display the processor info"
echo "/usr/local/sbin/dmidecode -t processor"
/usr/bin/dmidecode -t processor
status=$?
if test $status -eq 0
then
    echo "command /usr/bin/dmidecode -t processor [PASS]"
else
    echo "command /usr/bin/dmidecode -t processor [FAIL]"
    exit
fi

echo "dmidecode command to display the Physical Memory Array"
echo "/usr/local/sbin/dmidecode -t 16"
/usr/bin/dmidecode -t 16
status=$?
if test $status -eq 0
then
    echo "command /usr/bin/dmidecode -t 16 [PASS]"
else
    echo "command /usr/bin/dmidecode -t 16 [FAIL]"
    exit
fi

echo "dmidecode command to display the system info"
echo "/usr/local/sbin/dmidecode -t system"
/usr/bin/dmidecode -t system
status=$?
if test $status -eq 0
then
    echo "command /usr/bin/dmidecode -t system [PASS]"
else
    echo "command /usr/bin/dmidecode -t system [FAIL]"
    exit
fi

echo "dmidecode command to display the Memory device types"
echo "/usr/local/sbin/dmidecode -t memory"
/usr/bin/dmidecode -t memory
status=$?
if test $status -eq 0
then
    echo "command /usr/bin/dmidecode -t memory [PASS]"
else
    echo "command /usr/bin/dmidecode -t memory [FAIL]"
    exit
fi

echo "dmidecode command to display bios info"
echo "/usr/local/sbin/dmidecode -t bios"
/usr/bin/dmidecode -t bios
status=$?
if test $status -eq 0
then
    echo "command /usr/bin/dmidecode -t bios [PASS]"
else
    echo "command /usr/bin/dmidecode -t bios [FAIL]"
    exit
fi

exit

