###############################################################################

# This script tests the ftrace tool.

#Usage:
# $ sh test_ftrace.sh

################################################################################
#!/bin/bash
    
#ftrace - Linux kernel internal tracer   
# Testing ftrace 
echo "Ftrace test- reading function trace"
echo function > /sys/kernel/debug/tracing/current_tracer
cat /sys/kernel/debug/tracing/current_tracer 
#cat /sys/kernel/debug/tracing/trace
status=$?
if test $status -eq 0
then
    echo "Ftrace - reading trace passed"
else
    echo "Ftrace - reading trace failed"
    exit
fi

echo "Ftrace test- reading stack trace"
echo 1 >/proc/sys/kernel/stack_tracer_enabled
cat /sys/kernel/debug/tracing/stack_trace
status=$?
if test $status -eq 0
then
    echo "Ftrace - reading stacktrace passed"
else
    echo "Ftrace - reading stacktrace failed"
    exit
fi

echo "Ftrace test- standard tests for ftrace"
./ftrace/ftracetest
status=$?
if test $status -ne 0
then
    echo "Ftrace - ftracetest failed"
    exit
fi

exit



