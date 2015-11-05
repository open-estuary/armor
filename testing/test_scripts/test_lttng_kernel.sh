###############################################################################

# This script tests the LTTNG tools for kernel

#Usage:
# $ sh test_lttng_kernel.sh

################################################################################
#!/bin/bash
    
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
    echo "command lttng create failed"
    exit
fi

lttng enable-event --kernel sched_switch,sched_process_fork
#lttng enable-event --kernel --all
status=$?
if test $status -ne 0
then
    echo "command lttng enable-event failed"
    exit 
fi

lttng start
status=$?
if test $status -ne 0
then
    echo "command lttng start failed"
    exit
fi

# add any command here
sleep 2 

lttng stop
status=$?
if test $status -ne 0
then
    echo "command lttng stop failed"
    exit
fi


lttng view
status=$?
if test $status -ne 0
then
    echo "command lttng view failed"
    exit
fi


lttng destroy
status=$?
if test $status -ne 0
then
    echo "command lttng distroy failed"
    exit
fi

echo "lttng test for kernel completed"

exit










