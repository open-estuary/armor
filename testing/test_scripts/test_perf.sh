###############################################################################

# This script tests the perf tool

#Usage:
# $ sh test_perf.sh 

################################################################################
#!/bin/bash

#check if installed
bash check_install.sh perf
status=$?
if test $status -eq 1
then
        exit
fi

perf list | grep -i "hardware cache event"
status=$?
if test $status -eq 0
then
    echo "command perf list [PASS]"
else
    echo "command perf list [FAIL]"
    exit -1
fi

perf stat -e cpu-cycles sleep 1 >/dev/null
status=$?
if test $status -eq 0
then
    echo "command perf cpu-cycles event [PASS]"
else
    echo "command perf cpu-cycles event [FAIL]"
    exit -1
fi

perf_event_name=`perf list | grep "hisi_l3c" | head -n1 | awk -F '         ' '{print $1}'`
if [ -z $perf_event_name ]
then
	echo "No hisi related perf events [FAIL]"
	exit -1
fi

perf stat -a -e $perf_event_name sleep 1 >/dev/null
status=$?
if test $status -eq 0
then
    echo "command perf stat for LLC event [PASS]"
else
    echo "command perf stat for LLC event [FAIL]"
    exit -1
fi

exit 0
