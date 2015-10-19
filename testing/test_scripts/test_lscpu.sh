###############################################################################

# This script tests the lscpu tool

#Usage:
# $ sh test_lscpu.sh 

################################################################################
#!/bin/bash
    
#lscpu   
lscpu -V
status=$?
if test $status -eq 0
then
    echo "command lscpu -V passed"
else
    echo "command lscpu -V failed"
    exit
fi
 
echo "lscpu - gathers CPU architecture information from sysfs and
      /proc/cpuinfo."
lscpu
status=$?
if test $status -eq 0
then
    echo "command lscpu passed"
else
    echo "command lscpu failed"
    exit
fi
exit



