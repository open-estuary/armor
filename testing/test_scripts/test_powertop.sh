###############################################################################

# This script does basic tests for the powertop tools

#Usage:
# $ sh test_powertop.sh

################################################################################
#!/bin/bash
    
#check if installed
bash check_install.sh powertop
status=$?
if test $status -eq 1
then
        exit
fi

# Testing powertop
powertop --version
status=$?
if test $status -eq 0
then
    echo "command powertop --version [PASS]"
else
    echo "command powertop --version [FAIL]"
    exit
fi

echo "testing powertop - please press esc after test to exit"
powertop
status=$?
if test $status -eq 0
then
    echo "command powertop [PASS]"
else
    echo "command powertop [FAIL]"
    exit
fi
exit


