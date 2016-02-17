###############################################################################

# This script tests the latencytop tool

#Usage:
# $ sh test_latencytop.sh 

################################################################################
#!/bin/bash
    
#latencytop
echo "latencytop"
echo "To exit latencytop, please press ctrl-C"
latencytop                    
status=$?
if test $status -eq 0
then
   echo "Command latencytop passed"
else
   echo "Command latencytop failed"
   exit
fi
exit


