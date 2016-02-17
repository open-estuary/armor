###############################################################################

# This script tests the df tool

#Usage:
# $ sh test_df.sh

################################################################################
#!/bin/bash
    
#df
#Testing df
df --v
status=$?
if test $status -eq 0
then
    echo "command df --v  passed"
else
    echo "command df --v failed"
    exit
fi

echo "df - display informaton on the file systems with their mount points, memory usage"
df
status=$?
if test $status -eq 0
then
    echo "command df passed"
else
    echo "command df failed"
exit
fi
exit

