###############################################################################

# This script tests the sed tool

#Usage:
# $ sh test_sed.sh 

################################################################################
#!/bin/bash

bash check_install.sh sed
status=$?
if test $status -eq 1
then
        exit
fi
    
#sed
sed --version
status=$?
if test $status -eq 0
then
    echo "command sed --version [PASS]"
else
    echo "command sed --version [FAIL]"
    exit
fi

echo "sed - a special editor for modifying files automatically"
echo windows server | sed s/windows/linux/
status=$?
if test $status -eq 0
then
    echo "command sed s/windows/linux/ [PASS]"
else
    echo "command sed s/windows/linux/ [FAIL]"
    exit
fi
exit

