###############################################################################

# This script tests the lscpu tool

#Usage:
# $ sh test_lscpu.sh 

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh lscpu
status=$?
if test $status -eq 1
then
        exit
fi
    
#lscpu   
lscpu -V
status=$?
if test $status -eq 0
then
    echo "command lscpu -V [PASS]"
else
    echo "command lscpu -V [FAIL]"
    exit
fi
 
echo "lscpu - gathers CPU architecture information from sysfs and
      /proc/cpuinfo."
lscpu
status=$?
if test $status -eq 0
then
    echo "command lscpu [PASS]"
else
    echo "command lscpu [FAIL]"
    exit
fi
exit



