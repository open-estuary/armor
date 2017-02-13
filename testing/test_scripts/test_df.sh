###############################################################################

# This script tests the df tool

#Usage:
# $ sh test_df.sh

################################################################################
#!/bin/bash
    
#check if installed
bash check_install.sh df
status=$?
if test $status -eq 1
then
        exit
fi

#df
#Testing df
df --v
status=$?
if test $status -eq 0
then
    echo "command df --v  [PASS]"
else
    echo "command df --v [FAIL]"
    exit
fi

echo "df - display informaton on the file systems with their mount points, memory usage"
df
status=$?
if test $status -eq 0
then
    echo "command df [PASS]"
else
    echo "command df [FAIL]"
exit
fi
exit

