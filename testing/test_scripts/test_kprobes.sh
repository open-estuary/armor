###############################################################################

# This script tests the kprobes tools

#Usage:
# $ sh test_kprobes.sh

################################################################################
#!/bin/bash
    
#top
# Testing kprobes
insmod kprobe_test.ko
status=$?
if test $status -ne 0
then
    echo "command insmod kprobe_test.ko failed"
    exit
fi

echo 7 > /proc/sys/kernel/printk

echo "testing kprobes... watch for kprobe pre_handler and kprobe post_handler prints on the console for successful kprobes operation"
sleep 1

./kprobe_test
status=$?
if test $status -ne 0
then
    echo "command ./kprobe_test faild"
    exit
fi

echo 4 > /proc/sys/kernel/printk
rmmod kprobe_test.ko

echo "testing kprobes finished"

exit
