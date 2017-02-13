###############################################################################

# This script tests the LTTNG tools for kernel

#Usage:
# $ sh test_lttng_kernel.sh

################################################################################
#!/bin/bash
 
#check if installed
bash check_install.sh lttng
status=$?
if test $status -eq 1
then
        exit
fi
   
lttng list --kernel
status=$?
if test $status -ne 0
then
    echo "command lttng list --kernel failed"
    exit
fi

lttng create lttng_kernel_test
status=$?
if test $status -ne 0
then
    echo "command lttng create [FAIL]"
    exit
fi

lttng enable-event --kernel sched_switch,sched_process_fork
#lttng enable-event --kernel --all
status=$?
if test $status -ne 0
then
    echo "command lttng enable-event [FAIL]"
    exit 
fi

lttng start
status=$?
if test $status -ne 0
then
    echo "command lttng start [FAIL]"
    exit
fi

# add any command here
sleep 2 

lttng stop
status=$?
if test $status -ne 0
then
    echo "command lttng stop [FAIL]"
    exit
fi


lttng view
status=$?
if test $status -ne 0
then
    echo "command lttng view [FAIL]"
    exit
fi


lttng destroy
status=$?
if test $status -ne 0
then
    echo "command lttng distroy [FAIL]"
    exit
fi

echo "lttng test for kernel completed"

exit










