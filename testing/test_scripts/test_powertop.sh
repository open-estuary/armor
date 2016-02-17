###############################################################################

# This script does basic tests for the powertop tools

#Usage:
# $ sh test_powertop.sh

################################################################################
#!/bin/bash
    
# Testing powertop
powertop --version
status=$?
if test $status -eq 0
then
    echo "command powertop --version passed"
else
    echo "command powertop --version failed"
    exit
fi

echo "testing powertop - please press esc after test to exit"
powertop
status=$?
if test $status -eq 0
then
    echo "command powertop passed"
else
    echo "command powertop failed"
    exit
fi
exit


