###############################################################################

# This script tests the latencytop tool

#Usage:
# $ sh test_latencytop.sh 

################################################################################
#!/bin/bash
    
#check if installed
bash check_install.sh latencytop
status=$?
if test $status -eq 1
then
        exit
fi

#latencytop
echo "latencytop"
echo "To exit latencytop, please press ctrl-C"
latencytop                    
status=$?
if test $status -eq 0
then
   echo "Command latencytop [PASS]"
else
   echo "Command latencytop [FAIL]"
   exit
fi
exit


