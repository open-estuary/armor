###############################################################################

# This script tests the ktap tool

#Usage:
# $ sh test_ktap.sh

################################################################################
#!/bin/bash

modprobe ktapvm

#check if installed
bash check_install.sh ktap
status=$?
if test $status -eq 1
then
        exit
fi
    
#ktap
ktap -V   

echo "ktap helloworld.kp"
ktap ./ktap_samples/helloworld.kp
status=$?
if test $status -eq 0
then
   echo "Command ktap helloworld.kp [PASS]"
else
   echo "Command ktap helloworld.kp [FAIL]"
   exit
fi

./ktap_samples/ansi_color_demo.kp 
status=$?
if test $status -eq 0
then
   echo "Command ./ansi_color_demo.kp [PASS]"
else
   echo "Command ./ansi_color_demo.kp [FAIL]"
   exit
fi

./ktap_samples/hardirq_time.kp
status=$?
if test $status -eq 0
then
   echo "Command ./hardirq_time.kp [PASS]"
else
   echo "Command ./hardirq_time.kp [FAIL]"
   exit
fi

./ktap_samples/softirq_time.kp
status=$?
if test $status -eq 0
then
   echo "Command ./softirq_time.kp [PASS]"
else
   echo "Command ./softirq_time.kp [FAIL]"
   exit
fi

./ktap_samples/kmem_count.kp
status=$?
if test $status -eq 0
then
   echo "Command ./kmem_count.kp [PASS]"
else
   echo "Command ./kmem_count.kp [FAIL]"
   exit
fi

./ktap_samples/stack_profile.kp
status=$?
if test $status -eq 0
then
   echo "Command ./stack_profile.kp [PASS]"
else
   echo "Command ./stack_profile.kp [FAIL]"
   exit
fi

./ktap_samples/sched_transition.kp
status=$?
if test $status -eq 0
then
   echo "Command ./sched_transition.kp [PASS]"
else
   echo "Command ./sched_transition.kp [FAIL]"
   exit
fi

./ktap_samples/syscalls_count_by_proc.kp
status=$?
if test $status -eq 0
then
   echo "Command ./syscalls_count_by_proc.kp [PASS]"
else
   echo "Command ./syscalls_count_by_proc.kp [FAIL]"
   exit
fi

./ktap_samples/syscalls_count.kp
status=$?
if test $status -eq 0
then
   echo "Command ./syscalls_count.kp [PASS]"
else
   echo "Command ./syscalls_count.kp [FAIL]"
   exit
fi

./ktap_samples/syslatl.kp
status=$?
if test $status -eq 0
then
   echo "Command ./syslatl.kp [PASS]"
else
   echo "Command ./syslatl.kp [FAIL]"
   exit
fi

exit
