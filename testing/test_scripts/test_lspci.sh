###############################################################################

# This script tests the lspci tool

#Usage:
# $ sh test_lspci.sh 

################################################################################
#!/bin/bash
    
#lcpci   
lspci --version
status=$?
if test $status -eq 0
then
    echo "command lspci --version [PASS]"
else
    echo "command lspci --version [FAIL]"
    exit
fi

echo " lspci - display information about all the PCI bus"
lspci
status=$?
if test $status -eq 0
then
    echo "command lspci [PASS]"
else
    echo "command lspci [FAIL]"
    exit
fi
exit

