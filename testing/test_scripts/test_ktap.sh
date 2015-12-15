###############################################################################

# This script tests the ktap tool

#Usage:
# $ sh test_ktap.sh

################################################################################
#!/bin/bash
    
#ktap
ktap -V   

echo "ktap helloworld.kp"
ktap helloworld.kp
status=$?
if test $status -eq 0
then
   echo "Command ktap helloworld.kp passed"
else
   echo "Command ktap helloworld.kp failed"
   exit
fi

echo "ktap -e \"trace syscalls:* { print(argstr) }\" -- ls"
ktap -e "trace syscalls:* { print(argstr) }" -- ls
status=$?
if test $status -eq 0
then
   echo "Command ktap -e \"trace syscalls:* { print(argstr) }\" -- ls passed"
else
   echo "Command ktap -e \"trace syscalls:* { print(argstr) }\" -- ls failed"
   exit
fi




