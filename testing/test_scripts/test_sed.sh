###############################################################################

# This script tests the sed tool

#Usage:
# $ sh test_sed.sh 

################################################################################
#!/bin/bash
    
#sed
sed --version
status=$?
if test $status -eq 0
then
    echo "command sed --version passed"
else
    echo "command sed --version failed"
    exit
fi

echo "sed - a special editor for modifying files automatically"
echo windows server | sed s/windows/linux/
status=$?
if test $status -eq 0
then
    echo "command sed s/windows/linux/ passed"
else
    echo "command sed s/windows/linux/ failed"
    exit
fi
exit

